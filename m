From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/efi: Do not insert timestamps in efi
 files
Date: Thu, 25 Oct 2018 15:00:56 +0100
Message-ID: <d9db83e2-3f03-78ff-b92c-85ca680b7924@citrix.com>
References: <7a88f5cb-8f0a-9974-8e84-990045cb8726@suse.de>
 <20181024134522.3295-1-bwiedemann@suse.de>
 <108D0A7C020000E4CA4B4E14@prv1-mh.provo.novell.com>
 <74F2501302000079CA4B4E14@prv1-mh.provo.novell.com>
 <5BD1B8AA02000078001F4A44@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BD1B8AA02000078001F4A44@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, "Bernhard M.Wiedemann" <bwiedemann@suse.de>
Cc: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMTAvMTggMTM6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI0LjEwLjE4IGF0
IDE1OjQ1LCA8YndpZWRlbWFubkBzdXNlLmRlPiB3cm90ZToKPj4gaW4gb3JkZXIgdG8gbWFrZSBi
dWlsZHMgcmVwcm9kdWNpYmxlLgo+PiBTZWUgaHR0cHM6Ly9yZXByb2R1Y2libGUtYnVpbGRzLm9y
Zy8gZm9yIHdoeSB0aGlzIGlzIGdvb2QuCj4gQnV0IGlzIHRoaXMgc29tZXRoaW5nIGV2ZXJ5b25l
IHdhbnRzLCB1bmNvbmRpdGlvbmFsbHk/IEknbQo+IGdlbmVyYWxseSBoYXBweSB0byBoYXZlIHRo
aXMgYmFzaWMgaW5kaWNhdGlvbiBvZiB3aGVuIGEgY2VydGFpbgo+IGltYWdlIHdhcyBidWlsdDsg
SSByZWdyZXQgdGhhdCBFTEYgaW1hZ2VzIGhhdmUgbm8gc3VjaAo+IGluZGljYXRpb24uCgpXaGF0
IHByYWN0aWNhbCBwdXJwb3NlIGRvZXMgaGF2aW5nIGEgdGltZSBzdGFtcCBzZXJ2ZT/CoCBJZiB5
b3UgcmVhbGx5Cm5lZWQgdG8gc2VlLCB3aGF0IGlzIHdyb25nIHdpdGggdGhlIG10aW1lIGluIHlv
dXIgYnVpbGQgdHJlZT8KCkZvciBzaGlwcGVkIGJpbmFyaWVzIHRvIGN1c3RvbWVycywgZXhhY3Rs
eSB3aGVuIGl0IHdhcyBidWlsdCBpcwppcnJlbGV2YW50LCB3aGVyZWFzIHBlb3BsZXMgYWJpbGl0
eSB0byBpbmRlcGVuZGVudGx5IHZlcmlmeSB0aGUKaW50ZWdyaXR5IG9mIHRoZSBiaW5hcnkgaXMg
aW1wb3J0YW50LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
