From: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v1 3/8] kexec: export PG_offline to
 VMCOREINFO
Date: Wed, 21 Nov 2018 14:04:58 +0800
Message-ID: <20181121060458.GC7386__9330.40407621792$1542780236$gmane$org@MiWiFi-R3L-srv>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-4-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2HZ2=OA=redhat.com=bhe@srs-us1.protection.inumbo.net>)
 id 1gPLdT-0005tl-U9
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 06:05:15 +0000
Content-Disposition: inline
In-Reply-To: <20181119101616.8901-4-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>, Borislav Petkov <bp@alien8.de>, devel@linuxdriverproject.org, linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lianbo Jiang <lijiang@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMTkvMTggYXQgMTE6MTZhbSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gZGlmZiAt
LWdpdCBhL2tlcm5lbC9jcmFzaF9jb3JlLmMgYi9rZXJuZWwvY3Jhc2hfY29yZS5jCj4gaW5kZXgg
OTMzY2IzZTQ1Yjk4Li4wOTNjOWY5MTdlZDAgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2NyYXNoX2Nv
cmUuYwo+ICsrKyBiL2tlcm5lbC9jcmFzaF9jb3JlLmMKPiBAQCAtNDY0LDYgKzQ2NCw4IEBAIHN0
YXRpYyBpbnQgX19pbml0IGNyYXNoX3NhdmVfdm1jb3JlaW5mb19pbml0KHZvaWQpCj4gIAlWTUNP
UkVJTkZPX05VTUJFUihQQUdFX0JVRERZX01BUENPVU5UX1ZBTFVFKTsKPiAgI2lmZGVmIENPTkZJ
R19IVUdFVExCX1BBR0UKPiAgCVZNQ09SRUlORk9fTlVNQkVSKEhVR0VUTEJfUEFHRV9EVE9SKTsK
PiArI2RlZmluZSBQQUdFX09GRkxJTkVfTUFQQ09VTlRfVkFMVUUJKH5QR19vZmZsaW5lKQo+ICsJ
Vk1DT1JFSU5GT19OVU1CRVIoUEFHRV9PRkZMSU5FX01BUENPVU5UX1ZBTFVFKTsKPiAgI2VuZGlm
CgpUaGlzIHNvbHV0aW9uIGxvb2tzIGdvb2QgdG8gbWUuIE9uZSBzbWFsbCBjb25jZXJuIGlzIHdo
eSB3ZSBkb24ndApleHBvcnQgUEdfb2ZmbGluZSB0byB2bWNvcmVpbmZvIGRpcmVjdGx5LCB0aGVu
IGRlZmluZQpQQUdFX09GRkxJTkVfTUFQQ09VTlRfVkFMVUUgaW4gbWFrZWR1bXBmaWxlLiBXZSBo
YXZlIGJlZW4gZXhwb3J0aW5nCmtlcm5lbCBkYXRhL01BQ1JPIGRpcmVjdGx5LCB3aHkgdGhpcyBv
bmUgaXMgZXhjZXB0aW9uYWwuCgpUaGFua3MKQmFvcXVhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
