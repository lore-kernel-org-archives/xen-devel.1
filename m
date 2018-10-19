From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 21/23] xen/vpl011: buffer out chars when
 the backend is xen
Date: Fri, 19 Oct 2018 16:20:54 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1810191614150.31582@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810051140030.24936@sstabellini-ThinkPad-X260>
 <1538765251-25256-21-git-send-email-sstabellini@kernel.org>
 <5BBB265002000078001EF70A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BBB265002000078001EF70A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCA4IE9jdCAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDUuMTAuMTgg
YXQgMjA6NDcsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IC0tLSBhL3hlbi9k
cml2ZXJzL2NoYXIvY29uc29sZS5jCj4gPiArKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUu
Ywo+ID4gQEAgLTQwNiw2ICs0MDYsMTMgQEAgc3RhdGljIHZvaWQgZHVtcF9jb25zb2xlX3Jpbmdf
a2V5KHVuc2lnbmVkIGNoYXIga2V5KQo+ID4gICAqLwo+ID4gIHN0YXRpYyB1bnNpZ25lZCBpbnQg
X19yZWFkX21vc3RseSBjb25zb2xlX3J4ID0gMDsKPiA+ICAKPiA+ICtzdHJ1Y3QgZG9tYWluICpj
b25zb2xlX2lucHV0X2RvbWFpbih2b2lkKQo+ID4gK3sKPiA+ICsgICAgaWYgKCBjb25zb2xlX3J4
ID09IDAgKQo+ID4gKyAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gKyAgICByZXR1cm4gZ2V0
X2RvbWFpbl9ieV9pZChjb25zb2xlX3J4IC0gMSk7Cj4gCj4gVGhpcyBhY3F1aXJlcyBhIGRvbWFp
biByZWZlcmVuY2UsIHlldCBJIGNhbid0IHNlZSB0aGF0IHJlZmVyZW5jZQo+IGdldHRpbmcgZHJv
cHBlZCBhbnl3aGVyZSBpbiB0aGUgY2FsbGVyLgoKV2VsbCBzcG90dGVkIQoKSSdsbCBhZGQgYSBj
b21tZW50IGhlcmUgYXMgYSByZW1pbmRlciwgYW5kIEknbGwgZHJvcCB0aGUgZG9tYWluCnJlZmVy
ZW5jZSBpbiB0aGUgY2FsbGVyICh4ZW4vYXJjaC9hcm0vdnBsMDExLmM6dnBsMDExX3dyaXRlX2Rh
dGFfeGVuKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
