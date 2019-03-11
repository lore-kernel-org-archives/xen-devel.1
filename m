From: Dave Young <dyoung@redhat.com>
Subject: Re: [PATCH v2 3/8] kexec: export PG_offline to
 VMCOREINFO
Date: Mon, 11 Mar 2019 18:04:38 +0800
Message-ID: <20190311100438.GA12545__46444.4226281316$1552298748$gmane$org@dhcp-128-65.nay.redhat.com>
References: <20181122100627.5189-1-david@redhat.com>
 <20181122100627.5189-4-david@redhat.com>
 <20190311090402.GA12071@dhcp-128-65.nay.redhat.com>
 <d9e578c3-5ae6-5e82-a0a8-14c7e12c729f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DNMw=RO=redhat.com=dyoung@srs-us1.protection.inumbo.net>)
 id 1h3Hnl-0005Y5-HE
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 10:04:57 +0000
Content-Disposition: inline
In-Reply-To: <d9e578c3-5ae6-5e82-a0a8-14c7e12c729f@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, Borislav Petkov <bp@alien8.de>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lianbo Jiang <lijiang@redhat.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IFRoZSBwYXRjaCBoYXMgYmVlbiBtZXJnZWQsIHdvdWxkIHlvdSBtaW5kIHRvIHNlbmQgYSBk
b2N1bWVudGF0aW9uIHBhdGNoCj4gPiBmb3IgdGhlIHZtY29yZWluZm8sIHdoaWNoIGlzIGFkZGVk
IHJlY2VudGx5IGluIERvY3VtZW50YXRpb24va2R1bXAvdm1jb3JlaW5mby50eHQKPiA+IAo+ID4g
QSBicmllZiBkZXNjcmlwdGlvbiBhYm91dCBob3cgdGhpcyB2bWNvcmVpbmZvIGZpZWxkIGlzIHVz
ZWQgaXMgZ29vZCB0bwo+ID4gaGF2ZS4KPiA+IAo+IAo+IFR1cm5zIG91dCwgaXQgd2FzIGFscmVh
ZHkgZG9jdW1lbnRlZAo+IAo+IFBHX2xydXxQR19wcml2YXRlfFBHX3N3YXBjYWNoZXxQR19zd2Fw
YmFja2VkfFBHX3NsYWJ8UEdfaHdwb2lzaW9uCj4gfFBHX2hlYWRfbWFza3xQQUdFX0JVRERZX01B
UENPVU5UX1ZBTFVFKH5QR19idWRkeSkKPiB8UEFHRV9PRkZMSU5FX01BUENPVU5UX1ZBTFVFKH5Q
R19vZmZsaW5lKQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gUGFnZSBhdHRyaWJ1dGVzLiBUaGVzZSBmbGFncyBh
cmUgdXNlZCB0byBmaWx0ZXIgdmFyaW91cyB1bm5lY2Vzc2FyeSBmb3IKPiBkdW1waW5nIHBhZ2Vz
LgoKR29vZCBlbm91Z2gsIGp1c3QgaWdub3JlIHRoZSByZXF1ZXN0IQoKVGhhbmtzIQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
