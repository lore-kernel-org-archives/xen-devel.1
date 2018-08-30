From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: RFE: Detect NUMA misconfigurations and prevent
 machine freezes
Date: Thu, 30 Aug 2018 02:33:57 -0600
Message-ID: <5B87ABF502000078001E36A3@prv1-mh.provo.novell.com>
References: <6564259.GaOmOO5kt2@wopr.lan.crc.id.au>
 <29fc38c6-8908-2f6f-e496-a1644f56c59e@suse.com>
 <4e93ef83fb40d6a2a87f902f17bc0bc5@crc.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wyq4=ln=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvIOv-0001Fc-1x
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 08:34:01 +0000
In-Reply-To: <4e93ef83fb40d6a2a87f902f17bc0bc5@crc.id.au>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Steven Haigh <netwiz@crc.id.au>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA4LjE4IGF0IDA2OjAxLCA8bmV0d2l6QGNyYy5pZC5hdT4gd3JvdGU6Cj4gTWFu
YWdlZCB0byBnZXQgdGhlIHNhbWUgY3Jhc2ggbG9nIHdoZW4gYWRkaW5nIENQVXMgdG8gUG9vbC0x
IGFzIGZvbGxvd3M6Cj4gCj4gQ3JlYXRlIHRoZSBwb29sOgo+IChYRU4pIEluaXRpYWxpemluZyBD
cmVkaXQyIHNjaGVkdWxlcgo+IChYRU4pICBsb2FkX3ByZWNpc2lvbl9zaGlmdDogMTgKPiAoWEVO
KSAgbG9hZF93aW5kb3dfc2hpZnQ6IDMwCj4gKFhFTikgIHVuZGVybG9hZF9iYWxhbmNlX3RvbGVy
YW5jZTogMAo+IChYRU4pICBvdmVybG9hZF9iYWxhbmNlX3RvbGVyYW5jZTogLTMKPiAoWEVOKSAg
cnVucXVldWVzIGFycmFuZ2VtZW50OiBzb2NrZXQKPiAoWEVOKSAgY2FwIGVuZm9yY2VtZW50IGdy
YW51bGFyaXR5OiAxMG1zCj4gKFhFTikgbG9hZCB0cmFja2luZyB3aW5kb3cgbGVuZ3RoIDEwNzM3
NDE4MjQgbnMKPiAKPiBBZGQgdGhlIENQVXM6Cj4gKFhFTikgQWRkaW5nIGNwdSAxMiB0byBydW5x
dWV1ZSAwCj4gKFhFTikgIEZpcnN0IGNwdSBvbiBydW5xdWV1ZSwgYWN0aXZhdGluZwo+IChYRU4p
IFJlbW92aW5nIGNwdSAxMiBmcm9tIHJ1bnF1ZXVlIDAKPiAoWEVOKSBBZGRpbmcgY3B1IDEzIHRv
IHJ1bnF1ZXVlIDAKPiAoWEVOKSBSZW1vdmluZyBjcHUgMTMgZnJvbSBydW5xdWV1ZSAwCj4gKFhF
TikgQWRkaW5nIGNwdSAxNCB0byBydW5xdWV1ZSAwCj4gKFhFTikgUmVtb3ZpbmcgY3B1IDE0IGZy
b20gcnVucXVldWUgMAo+IChYRU4pIFhlbiBCVUcgYXQgc2NoZWRfY3JlZGl0Mi5jOjM0NTIKCmNy
ZWRpdDIgc3RpbGwgbm90IGJlaW5nIHRoZSBkZWZhdWx0IC0gZG8gdGhpbmdzIHdvcmsgaWYgeW91
IGRvbid0IG92ZXJyaWRlCnRoZSBkZWZhdWx0IChvZiB1c2luZyBjcmVkaXQxKT8gSSBndWVzcyB0
aGUgcHJvYmxlbSBpcyBjb25uZWN0ZWQgdG8gdGhlCiJSZW1vdmluZyBjcHUgPE4+IGZyb20gcnVu
cXVldWUgMCIsIGNvbnNpZGVyaW5nIHRoaXMKCiAgICBCVUdfT04oIWNwdW1hc2tfdGVzdF9jcHUo
Y3B1LCAmcnFkLT5hY3RpdmUpKTsKCmlzIHdoYXQgdHJpZ2dlcnMuIEFueXdheSAtIGFzIErDvHJn
ZW4gc2F5cywgc29tZXRoaW5nIGZvciB0aGUgc2NoZWR1bGVyCm1haW50YWluZXJzIHRvIGxvb2sg
aW50by4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
