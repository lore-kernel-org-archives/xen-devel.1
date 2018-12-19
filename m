From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Wed, 19 Dec 2018 15:10:00 +0100
Message-ID: <20181219141000.k426c7o6ncsdzrn5__18813.3558411666$1545228520$gmane$org@sirius.home.kraxel.org>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <c5fa494c-2ead-e190-6e8c-43478275f789@gmail.com>
 <20181219131452.cehks3kabcwuuk7i@sirius.home.kraxel.org>
 <dd166576-6771-a03f-bdee-ef798f789aed@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmpo=O4=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1gZcXz-0007Qk-N8
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 14:10:03 +0000
Content-Disposition: inline
In-Reply-To: <dd166576-6771-a03f-bdee-ef798f789aed@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

ICBIaSwKCj4gPiBTdXJlIHRoaXMgYWN0dWFsbHkgaGVscHM/ICBJdCdzIGJlbG93IDRHIGluIGd1
ZXN0IHBoeXNpY2FsIGFkZHJlc3MKPiA+IHNwYWNlLCBzbyBpdCBjYW4gYmUgYmFja2VkIGJ5IHBh
Z2VzIHdoaWNoIGFyZSBhY3R1YWxseSBhYm92ZSA0RyBpbiBob3N0Cj4gPiBwaHlzaWNhbCBhZGRy
ZXNzIHNwYWNlIC4uLgo+IAo+IFllcywgeW91IGFyZSByaWdodCBoZXJlLiBUaGlzIGlzIHdoeSBJ
IHdyb3RlIGFib3V0IHRoZSBJT01NVQo+IGFuZCBvdGhlciBjb25kaXRpb25zLiBFLmcuIHlvdSBj
YW4gaGF2ZSBhIGRldmljZSB3aGljaCBvbmx5Cj4gZXhwZWN0cyAzMi1iaXQsIGJ1dCB0aGFua3Mg
dG8gSU9NTVUgaXQgY2FuIGFjY2VzcyBwYWdlcyBhYm92ZQo+IDRHaUIgc2VhbWxlc3NseS4gU28s
IHRoaXMgaXMgd2h5IEkgKmhvcGUqIHRoYXQgdGhpcyBjb2RlICptYXkqIGhlbHAKPiBzdWNoIGRl
dmljZXMuIERvIHlvdSB0aGluayBJIGRvbid0IG5lZWQgdGhhdCBhbmQgaGF2ZSB0byByZW1vdmU/
CgpJIHdvdWxkIHRyeSB3aXRob3V0IHRoYXQsIGFuZCBtYXliZSBhZGQgYSBydW50aW1lIG9wdGlv
biAobW9kdWxlCnBhcmFtZXRlcikgbGF0ZXIgaWYgaXQgdHVybnMgb3V0IHNvbWUgaGFyZHdhcmUg
YWN0dWFsbHkgbmVlZHMgdGhhdC4KRGV2aWNlcyB3aGljaCBjYW4gZG8gMzJiaXQgRE1BIG9ubHkg
YmVjb21lIGxlc3MgYW5kIGxlc3MgY29tbW9uIHRoZXNlCmRheXMuCgo+ID4gPiA+ID4gK8KgwqDC
oCBpZiAoIWRtYV9tYXBfc2coZGV2LT5kZXYsIHhlbl9vYmotPnNndC0+c2dsLCB4ZW5fb2JqLT5z
Z3QtPm5lbnRzLAo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRE1BX0JJRElSRUNU
SU9OQUwpKSB7Cj4gPiA+ID4gCj4gPiA+ID4gQXJlIHlvdSB1c2luZyB0aGUgRE1BIHN0cmVhbWlu
ZyBBUEkgYXMgYSB3YXkgdG8gZmx1c2ggdGhlIGNhY2hlcz8KPiA+ID4gWWVzCj4gPiA+ID4gRG9l
cyB0aGlzIG1lYW4gdGhhdCBHRlBfVVNFUiBpc24ndCBtYWtpbmcgdGhlIGJ1ZmZlciBjb2hlcmVu
dD8KPiA+ID4gTm8sIGl0IGRpZG4ndCBoZWxwLiBJIGhhZCBhIHF1ZXN0aW9uIFsxXSBpZiB0aGVy
ZSBhcmUgYW55IG90aGVyIGJldHRlciB3YXkKPiA+ID4gdG8gYWNoaWV2ZSB0aGUgc2FtZSwgYnV0
IGRpZG4ndCBoYXZlIGFueSByZXNwb25zZSB5ZXQuIFNvLCBJIGltcGxlbWVudGVkCj4gPiA+IGl0
IHZpYSBETUEgQVBJIHdoaWNoIGhlbHBlZC4KPiA+IHNldF9wYWdlc19hcnJheV8qKCkgPwo+ID4g
Cj4gPiBTZWUgYXJjaC94ODYvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oCj4gV2VsbCwgeDg2Li4u
IEkgYW0gb24gYXJtIHdoaWNoIGRvZXNuJ3QgZGVmaW5lIHRoYXQuLi4KCk9oLCBhcm0uICBNYXli
ZSBhc2sgb24gYSBhcm0gbGlzdCB0aGVuLiAgSSBrbm93IG9uIGFybSB5b3UgaGF2ZSB0byBjYXJl
CmFib3V0IGNhY2hpbmcgYSBsb3QgbW9yZSwgYnV0IHRoYXQgYWxzbyBpcyB3aGVyZSBteSBrbm93
bGVkZ2UgZW5kcyAuLi4KClVzaW5nIGRtYV9tYXBfc2cgZm9yIGNhY2hlIGZsdXNoaW5nIGxvb2tz
IGxpa2UgYSBzbGVkZ2UgaGFtbWVyIGFwcHJvYWNoCnRvIG1lLiAgQnV0IG1heWJlIGl0IGlzIG5l
ZWRlZCB0byBtYWtlIHhlbiBmbHVzaCB0aGUgY2FjaGVzICh4ZW4gZ3Vlc3RzCmhhdmUgdGhlaXIg
b3duIGRtYSBtYXBwaW5nIGltcGxlbWVudGF0aW9uLCByaWdodD8gIE9yIGlzIHRoaXMgZGlmZmVy
ZW50Cm9uIGFybSB0aGFuIG9uIHg4Nj8pLgoKY2hlZXJzLAogIEdlcmQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
