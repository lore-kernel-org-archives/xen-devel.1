From: David Hildenbrand <david@redhat.com>
Subject: [PATCH RFCv2 4/4] mm/memory_hotplug: Drop
 MEMORY_TYPE_UNSPECIFIED
Date: Fri, 30 Nov 2018 18:59:22 +0100
Message-ID: <20181130175922.10425-5-david__26505.1367729486$1543600794$gmane$org@redhat.com>
References: <20181130175922.10425-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ub/h=OJ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gSn6D-0007F8-Nw
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 18:01:09 +0000
In-Reply-To: <20181130175922.10425-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Oscar Salvador <osalvador@suse.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>, Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org, x86@kernel.org, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "mike.travis@hpe.com" <mike.travis@hpe.com>, Dan Williams <dan.j.williams@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Andrew Banman <andrew.banman@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.>
List-Id: xen-devel@lists.xenproject.org

V2Ugbm93IGhhdmUgcHJvcGVyIHR5cGVzIGZvciBhbGwgdXNlcnMsIHdlIGNhbiBkcm9wIHRoaXMg
b25lLgoKQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
CkNjOiAiUmFmYWVsIEouIFd5c29ja2kiIDxyYWZhZWxAa2VybmVsLm9yZz4KQ2M6IEFuZHJldyBN
b3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29A
a2VybmVsLm9yZz4KQ2M6IFBhdmVsIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBvcmFjbGUuY29t
PgpDYzogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+CkNjOiBBbmRyZXcg
QmFubWFuIDxhbmRyZXcuYmFubWFuQGhwZS5jb20+CkNjOiAibWlrZS50cmF2aXNAaHBlLmNvbSIg
PG1pa2UudHJhdmlzQGhwZS5jb20+CkNjOiBPc2NhciBTYWx2YWRvciA8b3NhbHZhZG9yQHN1c2Uu
Y29tPgpDYzogRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT4KQ2M6IE1p
Y2hhbCBIb2NrbyA8bWhvY2tvQGtlcm5lbC5vcmc+CkNjOiBNaWNoYWwgU3VjaMOhbmVrIDxtc3Vj
aGFuZWtAc3VzZS5kZT4KQ2M6IFZpdGFseSBLdXpuZXRzb3YgPHZrdXpuZXRzQHJlZGhhdC5jb20+
CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IFBhdmVsIFRh
dGFzaGluIDxwYXZlbC50YXRhc2hpbkBtaWNyb3NvZnQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZp
ZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2Jhc2UvbWVtb3J5
LmMgIHwgMyAtLS0KIGluY2x1ZGUvbGludXgvbWVtb3J5LmggfCA1IC0tLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL21lbW9yeS5j
IGIvZHJpdmVycy9iYXNlL21lbW9yeS5jCmluZGV4IGM1ZmRjYTdhMzAwOS4uYTZlNTI0ZjBlYTM4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jhc2UvbWVtb3J5LmMKKysrIGIvZHJpdmVycy9iYXNlL21l
bW9yeS5jCkBAIC0zODgsOSArMzg4LDYgQEAgc3RhdGljIHNzaXplX3QgdHlwZV9zaG93KHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCiAJc3NpemVfdCBs
ZW4gPSAwOwogCiAJc3dpdGNoIChtZW0tPnR5cGUpIHsKLQljYXNlIE1FTU9SWV9CTE9DS19VTlNQ
RUNJRklFRDoKLQkJbGVuID0gc3ByaW50ZihidWYsICJ1bnNwZWNpZmllZFxuIik7Ci0JCWJyZWFr
OwogCWNhc2UgTUVNT1JZX0JMT0NLX0JPT1Q6CiAJCWxlbiA9IHNwcmludGYoYnVmLCAiYm9vdFxu
Iik7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZW1vcnkuaCBiL2luY2x1
ZGUvbGludXgvbWVtb3J5LmgKaW5kZXggYTNhMWU5NzY0ODA1Li4xMTY3OTYyMmY3NDMgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvbGludXgvbWVtb3J5LmgKKysrIGIvaW5jbHVkZS9saW51eC9tZW1vcnku
aApAQCAtNTAsMTAgKzUwLDYgQEAgaW50IHNldF9tZW1vcnlfYmxvY2tfc2l6ZV9vcmRlcih1bnNp
Z25lZCBpbnQgb3JkZXIpOwogICogIE5vIG1lbW9yeSBibG9jayBpcyB0byBiZSBjcmVhdGVkIChl
LmcuIGRldmljZSBtZW1vcnkpLiBOb3QgZXhwb3NlZCB0bwogICogIHVzZXIgc3BhY2UuCiAgKgot
ICogTUVNT1JZX0JMT0NLX1VOU1BFQ0lGSUVEOgotICogIFRoZSB0eXBlIG9mIG1lbW9yeSBibG9j
ayB3YXMgbm90IGZ1cnRoZXIgc3BlY2lmaWVkIHdoZW4gYWRkaW5nIHRoZQotICogIG1lbW9yeSBi
bG9jay4KLSAqCiAgKiBNRU1PUllfQkxPQ0tfQk9PVDoKICAqICBUaGlzIG1lbW9yeSBibG9jayB3
YXMgYWRkZWQgZHVyaW5nIGJvb3QgYnkgdGhlIGJhc2ljIHN5c3RlbS4gTm8KICAqICBzcGVjaWZp
YyBkZXZpY2UgZHJpdmVyIHRha2VzIGNhcmUgb2YgdGhpcyBtZW1vcnkgYmxvY2suIFRoaXMgbWVt
b3J5CkBAIC0xMDMsNyArOTksNiBAQCBpbnQgc2V0X21lbW9yeV9ibG9ja19zaXplX29yZGVyKHVu
c2lnbmVkIGludCBvcmRlcik7CiAgKi8KIGVudW0gewogCU1FTU9SWV9CTE9DS19OT05FID0gMCwK
LQlNRU1PUllfQkxPQ0tfVU5TUEVDSUZJRUQsCiAJTUVNT1JZX0JMT0NLX0JPT1QsCiAJTUVNT1JZ
X0JMT0NLX0RJTU0sCiAJTUVNT1JZX0JMT0NLX0RJTU1fVU5SRU1PVkFCTEUsCi0tIAoyLjE3LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
