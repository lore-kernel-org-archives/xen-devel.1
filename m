From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 11/57] ARM: VGIC: change to level-IRQ
 compatible IRQ injection interface
Date: Tue, 6 Mar 2018 11:53:59 +0000
Message-ID: <4f9e4baa-cc4d-2270-6c3a-35b921363530@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-12-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lh2b=f4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1etBAW-0002fq-Gl
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 11:54:08 +0000
In-Reply-To: <20180305160415.16760-12-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNS8wMy8xOCAxNjowMywgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gQXQgdGhlIG1v
bWVudCB2Z2ljX3ZjcHVfaW5qZWN0X2lycSgpIGlzIHRoZSBpbnRlcmZhY2UgZm9yIFhlbiBpbnRl
cm5hbAo+IGNvZGUgYW5kIHZpcnR1YWwgZGV2aWNlcyB0byBpbmplY3QgSVJRcyBpbnRvIGEgZ3Vl
c3QuIFRoaXMgaW50ZXJmYWNlIGhhcwo+IHR3byBzaG9ydGNvbWluZ3M6Cj4gMSkgSXQgcmVxdWly
ZXMgYSBWQ1BVIHBvaW50ZXIsIHdoaWNoIHdlIG1heSBub3Qga25vdyAoYW5kIGRvbid0IG5lZWQh
KQo+IGZvciBzaGFyZWQgaW50ZXJydXB0cy4gQSBzZWNvbmQgZnVuY3Rpb24gKHZnaWNfdmNwdV9p
bmplY3Rfc3BpKCkpLCB3YXMKPiB0aGVyZSB0byB3b3JrIGFyb3VuZCB0aGlzIGlzc3VlLgo+IDIp
IFRoaXMgaW50ZXJmYWNlIG9ubHkgcmVhbGx5IHN1cHBvcnRzIGVkZ2UgdHJpZ2dlcmVkIElSUXMs
IHdoaWNoIGlzCj4gd2hhdCB0aGUgWGVuIFZHSUMgZW11bGF0ZXMgb25seSBhbnl3YXkuIEhvd2V2
ZXIgdGhpcyBuZWVkcyB0byBhbmQgd2lsbAo+IGNoYW5nZSwgc28gd2UgbmVlZCB0byBhZGQgdGhl
IGRlc2lyZWQgbGV2ZWwgKGhpZ2ggb3IgbG93KSB0byB0aGUKPiBpbnRlcmZhY2UuCj4gVGhpcyBy
ZXBsYWNlcyB0aGUgZXhpc3RpbmcgaW5qZWN0aW9uIGNhbGwgKHRha2luZyBhIFZDUFUgYW5kIGFu
IElSUQo+IHBhcmFtZXRlcikgd2l0aCBhIG5ldyBvbmUsIHRha2luZyBkb21haW4sIFZDUFUsIElS
USBhbmQgbGV2ZWwgcGFyYW1ldGVycy4KPiBUaGUgVkNQVSBjYW4gYmUgTlVMTCBpbiBjYXNlIHdl
IGRvbid0IGtub3cgYW5kIGRvbid0IGNhcmUuCj4gV2UgY2hhbmdlIGFsbCBjYWxsIHNpdGVzIHRv
IHVzZSB0aGlzIG5ldyBpbnRlcmZhY2UuIFRoaXMgc3RpbGwgZG9lc24ndAo+IGdpdmUgdXMgdGhl
IG1pc3NpbmcgbGV2ZWwgSVJRIGhhbmRsaW5nLCBidXQgYXQgbGVhc3QgcHJlcGFyZXMgdGhlIGNh
bGxlcnMKPiB0byBkbyB0aGUgcmlnaHQgdGhpbmcgbGF0ZXIgYXV0b21hdGljYWxseS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4K
PiAtLS0KPiBDaGFuZ2Vsb2cgUkZDIC4uLiB2MToKPiAtIG5vIGNoYW5nZQoKSG1tbSwgb24gdGhl
IFJGQyB3ZSBhZ3JlZWQgdGhhdCB2Z2ljX2luamVjdF9pcnEgc2hvdWxkIHJldHVybiB2b2lkLiBB
bmQgCnByaW50aW5nIHNvbWUgZGVidWcgbWVzc2FnZXMgaWYgdGhlIHZnaWNfZ2V0X2lycSgpIGZh
aWxzLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
