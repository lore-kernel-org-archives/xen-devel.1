From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/5] x86/boot: Initialise the debug
 registers correctly
Date: Mon, 15 Oct 2018 14:24:05 +0200
Message-ID: <0782d5c6-b82c-1296-543d-3795bc69d17a@suse.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-2-git-send-email-andrew.cooper3@citrix.com>
 <20181015112829.d6bjtjyvihkbjada@mac.bytemobile.com>
 <ef74b81b-0dd5-b933-c49b-1ca313bb1846@suse.com>
 <18d38ac2-a94b-baf5-6108-5d8c3c7b2570@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <18d38ac2-a94b-baf5-6108-5d8c3c7b2570@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTAvMjAxOCAxNDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8xMC8xOCAx
Mjo0NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTUvMTAvMjAxOCAxMzoyOCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIE1vbiwgT2N0IDE1LCAyMDE4IGF0IDExOjM2OjE2QU0g
KzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gSW4gcGFydGljdWxhciwgaW5pdGlhbGlz
aW5nICVkcjYgd2l0aCB0aGUgdmFsdWUgMCBpcyBidWdneSwgYmVjYXVzZSBvbgo+Pj4+IGhhcmR3
YXJlIHN1cHBvcnRpbmcgVHJhbnNuYXRpb25hbCBNZW1vcnksIGl0IHdpbGwgY2F1c2UgdGhlIHN0
aWNreSBSVE0gYml0IHRvCj4+Pj4gYmUgYXNzZXJ0ZWQsIGV2ZW4gdGhvdWdoIGEgZGVidWcgZXhj
ZXB0aW9uIGZyb20gYSB0cmFuc2FjdGlvbiBoYXNuJ3QgYWN0dWFsbHkKPj4+PiBiZWVuIG9ic2Vy
dmVkLgo+Pj4+Cj4+Pj4gTW92ZSBYODZfRFI2X0RFRkFVTFQgaW50byB4ODYtZGVmbnMuaCBhbG9u
ZyB3aXRoIHRoZSBvdGhlciBhcmNoaXRlY3R1cmFsCj4+Pj4gcmVnaXN0ZXIgY29uc3RhbnRzLCBh
bmQgaW50cm9kdWNlIGEgbmV3IFg4Nl9EUjdfREVGQVVMVC4gIFVzZSB0aGUgZXhpc3RpbmcKPj4+
PiB3cml0ZV9kZWJ1Z3JlZygpIGhlbHBlciwgcmF0aGVyIHRoYW4gb3BlbmNvZGVkIGlubGluZSBh
c3NlbWJseS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPj4gV2hhdCBhYm91dDoKPj4KPj4gcy9UcmFuc25hdGlvbmFsL1RyYW5zYWN0
aW9uYWwvCj4+Cj4+IE9yIGRpZCB5b3UgbWVhbiBpbnRlcm5hdGlvbmFsPyAoU0NOUikKPiAKPiBJ
IGRpZCBtZWFuIFRyYW5zYWN0aW9uYWwgKGJ1dCBjb3VsZCBoYXZlIHN3b3JuIHRoYXQgSSBhbHJl
YWR5IGZpeGVkIHRoaXMKPiBzcGVjaWZpYyBtaXN0YWtlLsKgIE9idmlvdXNseSBub3QpLgoKSSd2
ZSBzZWVuIHRoaXMgdHlwbyBpbiBvdGhlciBjb21taXQgbWVzc2FnZXMgb2YgdGhlIHNlcmllcywg
dG9vLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
