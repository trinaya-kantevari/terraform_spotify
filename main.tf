terraform {
  required_providers {
    spotify = {
      version = "0.2.7"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.api_key
}

data "spotify_search_track" "by_artist" {
  artist = "Arijit Singh"
}

resource "spotify_playlist" "playlist" {
  name        = "My Monsoon Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
  ]
}
