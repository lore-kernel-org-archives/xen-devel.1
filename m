From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 7/9] xen/gntdev: Add initial support for
 dma-buf UAPI
Date: Tue, 12 Jun 2018 21:49:34 -0400
Message-ID: <916e91c9-0710-0afb-2f49-4a7c7b4c02b5__41946.7131993317$1528854528$gmane$org@oracle.com>
References: <20180612134200.17456-1-andr2000@gmail.com>
 <20180612134200.17456-8-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvra=i7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fSuuv-0006eh-Gt
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 01:49:45 +0000
In-Reply-To: <20180612134200.17456-8-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNi8xMi8yMDE4IDA5OjQxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToK
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRldi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2
LmMKPiBpbmRleCBhMDlkYjIzZTk2NjMuLmU4MjY2MGQ4MWQ3ZSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3hlbi9nbnRkZXYuYwo+ICsrKyBiL2RyaXZlcnMveGVuL2dudGRldi5jCj4gQEAgLTQ4LDYg
KzQ4LDkgQEAKPiAgICNpbmNsdWRlIDxhc20veGVuL2h5cGVyY2FsbC5oPgo+ICAgCj4gICAjaW5j
bHVkZSAiZ250ZGV2LWNvbW1vbi5oIgo+ICsjaWZkZWYgQ09ORklHX1hFTl9HTlRERVZfRE1BQlVG
Cj4gKyNpbmNsdWRlICJnbnRkZXYtZG1hYnVmLmgiCj4gKyNlbmRpZgo+ICAgCj4gICBNT0RVTEVf
TElDRU5TRSgiR1BMIik7Cj4gICBNT0RVTEVfQVVUSE9SKCJEZXJlayBHLiBNdXJyYXkgPERlcmVr
Lk11cnJheUBjbC5jYW0uYWMudWs+LCAiCj4gQEAgLTU2Niw2ICs1NjksMTUgQEAgc3RhdGljIGlu
dCBnbnRkZXZfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmxpcCkKPiAg
IAlJTklUX0xJU1RfSEVBRCgmcHJpdi0+ZnJlZWFibGVfbWFwcyk7Cj4gICAJbXV0ZXhfaW5pdCgm
cHJpdi0+bG9jayk7Cj4gICAKPiArI2lmZGVmIENPTkZJR19YRU5fR05UREVWX0RNQUJVRgo+ICsJ
cHJpdi0+ZG1hYnVmX3ByaXYgPSBnbnRkZXZfZG1hYnVmX2luaXQoKTsKPiArCWlmIChJU19FUlIo
cHJpdi0+ZG1hYnVmX3ByaXYpKSB7Cj4gKwkJcmV0ID0gUFRSX0VSUihwcml2LT5kbWFidWZfcHJp
dik7Cj4gKwkJa2ZyZWUocHJpdik7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiArI2VuZGlmCj4g
Kwo+ICAgCWlmICh1c2VfcHRlbW9kKSB7Cj4gICAJCXByaXYtPm1tID0gZ2V0X3Rhc2tfbW0oY3Vy
cmVudCk7Cj4gICAJCWlmICghcHJpdi0+bW0pIHsKPiBAQCAtNjE2LDggKzYyOCwxMyBAQCBzdGF0
aWMgaW50IGdudGRldl9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpm
bGlwKQo+ICAgCVdBUk5fT04oIWxpc3RfZW1wdHkoJnByaXYtPmZyZWVhYmxlX21hcHMpKTsKPiAg
IAltdXRleF91bmxvY2soJnByaXYtPmxvY2spOwo+ICAgCj4gKyNpZmRlZiBDT05GSUdfWEVOX0dO
VERFVl9ETUFCVUYKPiArCWdudGRldl9kbWFidWZfZmluaShwcml2LT5kbWFidWZfcHJpdik7Cj4g
KyNlbmRpZgo+ICsKPiAgIAlpZiAodXNlX3B0ZW1vZCkKPiAgIAkJbW11X25vdGlmaWVyX3VucmVn
aXN0ZXIoJnByaXYtPm1uLCBwcml2LT5tbSk7Cj4gKwo+ICAgCWtmcmVlKHByaXYpOwo+ICAgCXJl
dHVybiAwOwo+ICAgfQo+IEBAIC05ODcsNiArMTAwNCwxMDcgQEAgc3RhdGljIGxvbmcgZ250ZGV2
X2lvY3RsX2dyYW50X2NvcHkoc3RydWN0IGdudGRldl9wcml2ICpwcml2LCB2b2lkIF9fdXNlciAq
dSkKPiAgIAlyZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4gKyNpZmRlZiBDT05GSUdfWEVOX0dOVERF
Vl9ETUFCVUYKPiArc3RhdGljIGxvbmcKPiArZ250ZGV2X2lvY3RsX2RtYWJ1Zl9leHBfZnJvbV9y
ZWZzKHN0cnVjdCBnbnRkZXZfcHJpdiAqcHJpdiwKPiArCQkJCSAgc3RydWN0IGlvY3RsX2dudGRl
dl9kbWFidWZfZXhwX2Zyb21fcmVmcyBfX3VzZXIgKnUpCgoKRGlkbid0IHdlIGFncmVlIHRoYXQg
dGhpcyBjb2RlIG1vdmVzIHRvIGdudGRldi1kbWFidWYuYyA/CgotYm9yaXMKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
