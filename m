From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v12 8/9] mm / iommu: include need_iommu()
 test in iommu_use_hap_pt()
Date: Mon, 1 Oct 2018 12:24:12 +0100
Message-ID: <558d6a9d-4772-9a95-1bc5-8eef4a3d3a5c@arm.com>
References: <20180927143333.17516-1-paul.durrant@citrix.com>
 <20180927143333.17516-9-paul.durrant@citrix.com>
 <ef0310ed-3745-860f-3f1b-786f76187e97@arm.com>
 <233a49e3915444f4a6ea8e5cece8ce78@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7rit=mn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g6wJG-0000za-0R
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 11:24:18 +0000
In-Reply-To: <233a49e3915444f4a6ea8e5cece8ce78@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDEwLzAxLzIwMTggMTE6NTEgQU0sIFBhdWwgRHVycmFudCB3cm90ZToKPj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSnVsaWVuIEdyYWxsIFttYWlsdG86
anVsaWVuLmdyYWxsQGFybS5jb21dCj4+IFNlbnQ6IDAxIE9jdG9iZXIgMjAxOCAxMTozNwo+PiBU
bzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwu
Y29tPjsgR2VvcmdlIER1bmxhcAo+PiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+PiA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTIgOC85XSBtbSAvIGlvbW11OiBpbmNsdWRlIG5l
ZWRfaW9tbXUoKSB0ZXN0IGluCj4+IGlvbW11X3VzZV9oYXBfcHQoKQo+Pgo+PiBIaSBQYXVsLAo+
Pgo+PiBPbiAwOS8yNy8yMDE4IDAzOjMzIFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+PiBUaGUg
bmFtZSAnaW9tbXVfdXNlX2hhcF9wdCcgc3VnZ2VzdHMgdGhhdCB0aGF0IFAyTSB0YWJsZSBpcyBp
biB1c2UgYXMKPj4gdGhlCj4+PiBkb21haW4ncyBJT01NVSBwYWdldGFibGUgd2hpY2gsIHByaW9y
IHRvIHRoaXMgcGF0Y2gsIGlzIG5vdCBzdHJpY3RseQo+PiB0cnVlCj4+PiBzaW5jZSB0aGUgbWFj
cm8gZGlkIG5vdCB0ZXN0IHdoZXRoZXIgdGhlIGRvbWFpbiBhY3R1YWxseSBoYXMgSU9NTVUKPj4+
IG1hcHBpbmdzLgo+Pgo+PiBXZWxsLCBJIHRoaW5rIHdlIGFzc3VtZSB0aGF0IGlvbW11X3VzZV9o
YXBfcHQoKSB3aWxsIG9ubHkgYmUgY2FsbGVkIHdoZW4KPj4gbmVlZF9pb21tdShkKSA9PSAxLgo+
IAo+IFllcy4KPiAKPj4gQXQgdGhlIGVuZCwgeW91IHdpbGwgc3RpbGwgbmVlZCB0byBjaGVjawo+
PiBuZWVkX2lvbW11KGQpIG91dHNpZGUgYmVjYXVzZSBpb21tdV91c2VfaGFwX3B0KCkgbWF5IG5v
dyByZXR1cm4gMCBmb3IKPj4gZG9tYWluIHdpdGhvdXQgSU9NTVUgb3IgZm9yIGRvbWFpbiBub3Qg
c2hhcmluZyBwMm0gd2l0aCB0aGUgSU9NTVUuCj4+Cj4+IERvIHlvdSBleHBlY3QgYW4gaW1wcm92
ZW1lbnQgaW4gbG9uZy10ZXJtPwo+Pgo+IAo+IFllcy4gVGhlIHVsdGltYXRlIGdvYWwgaXMgdGhl
IHBhdGNoIHRvIHNwbGl0IHVwIG5lZWRfaW9tbXUoKSBpbnRvIHNlcGFyYXRlIG1hY3JvcyBmb3Ig
J2RvbWFpbiBoYXMgSU9NTVUgcHQnIGFuZCAnZG9tYWluIG5lZWRzIGV4cGxpY2l0IHN5bmMgb2Yg
SU9NTVUgcHQnIGFuZCB0aGlzIHNlZW1zIGxpa2UgYSBsb2dpY2FsIHN0ZXAuIEZvciAnbmVlZCBl
eHBsaWNpdCBzeW5jIG9mIElPTU1VIHB0JyB0byB0cnVlIHRoZW4gJ2hhcyBJT01NVSBwdCcgY2xl
YXJseSBuZWVkcyB0byBiZSB0cnVlLCBzbyBJIHdhbnRlZCB0aGUgbWFjcm8gZm9yICdzaGFyaW5n
IElPTU1VIHB0JyB0byBoYXZlIHRoZSBzYW1lIHByZWRpY2F0ZS4KCk1ha2Ugc2Vuc2VzLiBJdCBk
aWRuJ3Qgb2NjdXIgdG8gbWUgdGhhdCB3YXMgaW4gcHJlcGFyYXRpb24gb2YgdGhlIG5leHQgCnBh
dGNoLgoKRm9yIHRoZSBBcm0gYml0czoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
