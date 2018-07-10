From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 2/2] doc: correct
 intel_psr_cat_cdp.pandoc syntax
Date: Tue, 10 Jul 2018 15:24:33 +0200
Message-ID: <ce2f7fc5-b724-99d5-9c5d-02de6268dd6a@suse.com>
References: <20180508064731.12391-1-jgross@suse.com>
 <20180508064731.12391-3-jgross@suse.com>
 <2fbed677-89d2-f2a8-20c2-46f9d2b98a75@citrix.com>
 <866c935e-aa6d-3c52-d37a-bd8add1c3515@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ns0p=j2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fcsd9-0003mw-Hf
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 13:24:35 +0000
In-Reply-To: <866c935e-aa6d-3c52-d37a-bd8add1c3515@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, ross.lagerwall@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDUvMTggMTU6MDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDgvMDUvMTggMTQ6
NTYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDA1LzA4LzIwMTggMDc6NDcgQU0sIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6Cj4+PiAibWFrZSAtQyBkb2NzIGFsbCIgZmFpbHMgZHVlIHRvIGluY29y
cmVjdCBtYXJrZG93biBzeW50YXggaW4KPj4+IGludGVsX3Bzcl9jYXRfY2RwLnBhbmRvYy4gQ29y
cmVjdCBpdC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4+PiAtLS0KPj4+ICBkb2NzL2ZlYXR1cmVzL2ludGVsX3Bzcl9jYXRfY2RwLnBhbmRv
YyB8IDU2MiArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPj4+ICAxIGZpbGUgY2hh
bmdlZCwgMzAwIGluc2VydGlvbnMoKyksIDI2MiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZG9jcy9mZWF0dXJlcy9pbnRlbF9wc3JfY2F0X2NkcC5wYW5kb2MgYi9kb2NzL2ZlYXR1
cmVzL2ludGVsX3Bzcl9jYXRfY2RwLnBhbmRvYwo+Pj4gaW5kZXggMDRmYjI1NmRkOS4uYTA3NmU4
YTc1NSAxMDA2NDQKPj4+IC0tLSBhL2RvY3MvZmVhdHVyZXMvaW50ZWxfcHNyX2NhdF9jZHAucGFu
ZG9jCj4+PiArKysgYi9kb2NzL2ZlYXR1cmVzL2ludGVsX3Bzcl9jYXRfY2RwLnBhbmRvYwo+Pj4g
QEAgLTEsNSArMSw1IEBACj4+PiAgJSBJbnRlbCBDYWNoZSBBbGxvY2F0aW9uIFRlY2hub2xvZ3kg
YW5kIENvZGUgYW5kIERhdGEgUHJpb3JpdGl6YXRpb24gRmVhdHVyZXMKPj4+IC0lIFJldmlzaW9u
IDEuMTYKPj4+ICslIFJldmlzaW9uIDEuMTcKPj4KPj4gRG8gd2UgcmVhbGx5IG5lZWQgdG8gYnVt
cCB0aGUgcmV2aXNpb24gbnVtYmVyIGp1c3QgdG8gZml4IG1hcmtkb3duCj4+IGZvcm1hdHRpbmc/
Cj4gCj4gSSBqdXN0IGZvbGxvd2VkIHRoZSBleGFtcGxlIG9mIHZlcnNpb24gMS4xNiB3aGljaCB3
YXMgYSBtdWNoIHNtYWxsZXIKPiBzeW50YWN0aWNhbCBjaGFuZ2UuCgpQaW5nPwoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
