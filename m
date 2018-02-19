From: Juergen Gross <jgross@suse.com>
Subject: Re: PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
Date: Mon, 19 Feb 2018 18:46:00 +0100
Message-ID: <00be020c-7fe9-0862-5ba5-b87eea8e3c1b@suse.com>
References: <20180216174835.GJ4302@mail-itl>
 <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
 <20180216185122.GK4302@mail-itl>
 <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
 <20180216195415.GK2084@mail-itl>
 <1f3c44fb-e557-9b5c-6e9f-2ac40a8e0562@suse.com>
 <20180219172949.GY2084@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180219172949.GY2084@mail-itl>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMTggMTg6MjksIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPiBP
biBNb24sIEZlYiAxOSwgMjAxOCBhdCAwNjoyMzo0MFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOgo+PiBPbiAxNi8wMi8xOCAyMDo1NCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdy
b3RlOgo+Pj4gSnVzdCBiZWZvcmUgdGhlIEJVRygpLCB0aGVyZSBpcyBhIGNhbGwgdG8geGVuX3Jh
d19jb25zb2xlX3dyaXRlKCkuIEJ1dAo+Pj4gYXBwYXJlbnRseSBpdCB3YXMgdG9vIGVhcmx5Li4u
Cj4+Cj4+IERlcGVuZHMuCj4+Cj4+IFdpdGggYSBkZWJ1ZyBlbmFibGVkIGh5cGVydmlzb3IgYW5k
IGFwcHJvcHJpYXRlIGxvZyBsZXZlbHMgc2V0Cj4+IChndWVzdF9sb2dsdmw9YWxsKSB5b3Ugc2hv
dWxkIHNlZSB0aGUgbWVzc2FnZSBpbiB0aGUgaHlwZXJ2aXNvciBsb2cuCj4gCj4gSSd2ZSB0cmll
ZCB3aXRoIGd1ZXN0X2xvZ2x2bD1hbGwsIGJ1dCB0aGVyZSB3YXMgbm90aGluZy4gV291bGRuJ3Qg
aXQKPiBtYWtlIHNlbnNlIHRvIGVuYWJsZSB0aGlzIGZ1bmN0aW9uYWxpdHkgYWxzbyBpbiBub24t
ZGVidWcgYnVpbGRzIC0gb25seQo+IGd1YXJkZWQgYnkgZ3Vlc3RfbG9nbHZsPWFsbCBvcHRpb24/
CgpIbW0sIEkgdGhpbmsgdGhpcyBpcyBvbiBwdXJwb3NlIHRvIGF2b2lkIHRoZSBwb3NzaWJpbGl0
eSBvZiBhIGd1ZXN0CmZsb29kaW5nIHRoZSBoeXBlcnZpc29yIGxvZy4KCk1heWJlIGFkZGluZyBh
IG5ldyBvcHRpb24gKGUuZy4gZ3Vlc3RfbWVzc2FnZXM9b24vb2ZmKSBzd2l0Y2hhYmxlIGF0CnJ1
bnRpbWUgb25seSB2aWEgInhsIHNldC1wYXJhbWV0ZXJzIiB3b3VsZCBhdm9pZCB0aGUgZ2VuZXJh
bCBmbG9vZGluZwpwcm9ibGVtIHdoaWxlIGVuYWJsaW5nIGRpYWdub3NpcyBvZiBzdWNoIHByb2Js
ZW1zPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
