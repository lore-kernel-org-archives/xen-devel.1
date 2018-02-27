From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] xen: fix out-of-bounds irq unbind
 for MSI message groups
Date: Tue, 27 Feb 2018 16:58:10 +0000
Message-ID: <20180227165607.wrqp5tb7fmhqglea__44878.7912413993$1519750735$gmane$org@MacBook-Pro-de-Roger.local>
References: <1519746958-52077-1-git-send-email-aams@amazon.com>
 <1519746958-52077-2-git-send-email-aams@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wvqs=fv=citrix.com=prvs=589048569=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eqiba-0006il-6i
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 16:59:54 +0000
Content-Disposition: inline
In-Reply-To: <1519746958-52077-2-git-send-email-aams@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Shah <aams@amazon.com>
Cc: Juergen Gross <jgross@suse.com>, Eduardo Valentin <eduval@amazon.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Liu Shuo <shuo.a.liu@intel.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>, Anoob Soman <anoob.soman@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMDM6NTU6NTdQTSArMDAwMCwgQW1pdCBTaGFoIHdyb3Rl
Ogo+IFdoZW4gYW4gTVNJIGRlc2NyaXB0b3Igd2FzIG5vdCBhdmFpbGFibGUsIHRoZSBlcnJvciBw
YXRoIHdvdWxkIHRyeSB0bwo+IHVuYmluZCBhbiBpcnEgdGhhdCB3YXMgbmV2ZXIgYWNxdWlyZWQg
LSBwb3RlbnRpYWxseSB1bmJpbmRpbmcgYW4KPiB1bnJlbGF0ZWQgaXJxLgoKVGhvc2UgSVJRcyBo
YXZlIGJlZW4gYWxsb2NhdGVkIGluIHRoZSB4ZW5fYWxsb2NhdGVfaXJxc19keW5hbWljIGNhbGws
CnNvIEkgdGhpbmsgdGhlICJwb3RlbnRpYWxseSB1bmJpbmRpbmcgYW4gdW5yZWxhdGVkIGlycSIg
cGFydCBpcyB3cm9uZy4KVGhlIHVuYmluZCBjYWxsIHdvdWxkIGJlIHBlcmZvcm1lZCBhZ2FpbnN0
IGFuIHVuYm91bmQgSVJRLCB3aGljaCBpcwpoYXJtbGVzcyBBRkFJQ1QuCgo+IEZpeGVzOiA0ODky
YzliNGFkYTlmOSAoInhlbjogYWRkIHN1cHBvcnQgZm9yIE1TSSBtZXNzYWdlIGdyb3VwcyIpCj4g
UmVwb3J0ZWQtYnk6IEhvb21hbiBNaXJoYWRpIDxtaXJoYWRpaEBhbWF6b24uY29tPgo+IENDOiA8
c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNs
ZS5jb20+Cj4gQ0M6IEVkdWFyZG8gVmFsZW50aW4gPGVkdXZhbEBhbWF6b24uY29tPgo+IENDOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ0M6IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPgo+IENDOiAiSy4gWS4gU3Jpbml2YXNhbiIgPGt5c0BtaWNyb3NvZnQu
Y29tPgo+IENDOiBMaXUgU2h1byA8c2h1by5hLmxpdUBpbnRlbC5jb20+Cj4gQ0M6IEFub29iIFNv
bWFuIDxhbm9vYi5zb21hbkBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFtaXQgU2hhaCA8
YWFtc0BhbWF6b24uY29tPgo+IC0tLQo+ICBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2Uu
YyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIv
ZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiBpbmRleCAxYWI0YmQxLi5jODZkMTBl
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCj4gKysrIGIv
ZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKPiBAQCAtNzU1LDggKzc1NSwxMCBAQCBp
bnQgeGVuX2JpbmRfcGlycV9tc2lfdG9faXJxKHN0cnVjdCBwY2lfZGV2ICpkZXYsIHN0cnVjdCBt
c2lfZGVzYyAqbXNpZGVzYywKPiAgCW11dGV4X3VubG9jaygmaXJxX21hcHBpbmdfdXBkYXRlX2xv
Y2spOwo+ICAJcmV0dXJuIGlycTsKPiAgZXJyb3JfaXJxOgo+IC0JZm9yICg7IGkgPj0gMDsgaS0t
KQo+ICsJd2hpbGUgKGkgPiAwKSB7Cgp3aGlsZSAoaS0tKQoJX191bmJpbmRfZnJvbV9pcnEoaXJx
ICsgaSk7CgpBbHRob3VnaCBwbGVhc2Ugc2VlIHJlcGx5IHRvIHBhdGNoIDIuCgpSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
