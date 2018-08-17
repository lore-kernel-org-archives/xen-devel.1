From: David Hildenbrand <david@redhat.com>
Subject: [PATCH RFC 1/2] drivers/base: export
 lock_device_hotplug/unlock_device_hotplug
Date: Fri, 17 Aug 2018 09:59:00 +0200
Message-ID: <20180817075901.4608-2-david__4191.18472277677$1534492679$gmane$org@redhat.com>
References: <20180817075901.4608-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/cqo=la=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1fqZf8-00066r-Nj
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 07:59:14 +0000
In-Reply-To: <20180817075901.4608-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "K . Y . Srinivasan" <kys@microsoft.com>, linux-s390@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, Dan Williams <dan.j.williams@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Martin Schwidefsky <schwidefsky@de.ibm.com>, devel@linuxdriverproject.org, Vitaly
List-Id: xen-devel@lists.xenproject.org

RnJvbTogVml0YWx5IEt1em5ldHNvdiA8dmt1em5ldHNAcmVkaGF0LmNvbT4KCldlbGwgcmVxdWly
ZSB0byBjYWxsIGFkZF9tZW1vcnkoKS9hZGRfbWVtb3J5X3Jlc291cmNlKCkgd2l0aApkZXZpY2Vf
aG90cGx1Z19sb2NrIGhlbGQsIHRvIGF2b2lkIGEgbG9jayBpbnZlcnNpb24uIEFsbG93IGV4dGVy
bmFsIG1vZHVsZXMKKGUuZy4gaHZfYmFsbG9vbikgdGhhdCBtYWtlIHVzZSBvZiBhZGRfbWVtb3J5
KCkvYWRkX21lbW9yeV9yZXNvdXJjZSgpIHRvCmxvY2sgZGV2aWNlIGhvdHBsdWcuCgpTaWduZWQt
b2ZmLWJ5OiBWaXRhbHkgS3V6bmV0c292IDx2a3V6bmV0c0ByZWRoYXQuY29tPgpbbW9kaWZ5IHBh
dGNoIGRlc2NyaXB0aW9uXQpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2Jhc2UvY29yZS5jIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9jb3JlLmMgYi9k
cml2ZXJzL2Jhc2UvY29yZS5jCmluZGV4IDA0YmJjZDc3OWUxMS4uOTAxMGI5ZTk0MmI1IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2Jhc2UvY29yZS5jCisrKyBiL2RyaXZlcnMvYmFzZS9jb3JlLmMKQEAg
LTcwMCwxMSArNzAwLDEzIEBAIHZvaWQgbG9ja19kZXZpY2VfaG90cGx1Zyh2b2lkKQogewogCW11
dGV4X2xvY2soJmRldmljZV9ob3RwbHVnX2xvY2spOwogfQorRVhQT1JUX1NZTUJPTF9HUEwobG9j
a19kZXZpY2VfaG90cGx1Zyk7CiAKIHZvaWQgdW5sb2NrX2RldmljZV9ob3RwbHVnKHZvaWQpCiB7
CiAJbXV0ZXhfdW5sb2NrKCZkZXZpY2VfaG90cGx1Z19sb2NrKTsKIH0KK0VYUE9SVF9TWU1CT0xf
R1BMKHVubG9ja19kZXZpY2VfaG90cGx1Zyk7CiAKIGludCBsb2NrX2RldmljZV9ob3RwbHVnX3N5
c2ZzKHZvaWQpCiB7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
