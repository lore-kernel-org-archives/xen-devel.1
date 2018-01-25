From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 06/11] x86/entry: Organise the
 clobbering of the RSB/RAS on entry to Xen
Date: Thu, 25 Jan 2018 07:40:02 -0700
Message-ID: <5A69FA5202000078001A2688@prv-mh.provo.novell.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-7-git-send-email-andrew.cooper3@citrix.com>
 <5A69E75C02000078001A25EE@prv-mh.provo.novell.com>
 <b75097c9-3f63-2728-db30-37a17b890dcc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b75097c9-3f63-2728-db30-37a17b890dcc@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAxLjE4IGF0IDE1OjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDEvMTggMTM6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAgSSB0aGluayB3
ZSB3YW50IHRvIGhhdmUgdGhlIHNhbWUsIHRvIHBsZWFzZSBBTUQuIEknZAo+PiBzdWdnZXN0IHRv
IHVzZSBhbHRlcm5hdGl2ZSBwYXRjaGluZyB0aG91Z2ggKGV4Y2VwdCBhZ2FpbiBvbiB0aGUKPj4g
SVNUIHBhdGhzKSwgYnV0IHRoZW4gYWdhaW4gbWF5YmUgaW4gYSBmb2xsb3ctdXAgcGF0Y2guCj4g
Cj4gSSB0cnVzdCB0aGUgbGF0ZXIgcGF0Y2hlcyBhcmUgc3VpdGFibGUgaW4gdGhlIElTVCByZWdh
cmQ/CgpJJ3ZlIHJlc3BvbmRlZCB0byBwYXRjaCA3LiBXaGF0IG90aGVyIGxhdGVyIHBhdGNoZXMg
aGF2ZSBhbnl0aGluZwpJU1QtcmVsYXRlZD8KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
