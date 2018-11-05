From: Samuel Ortiz <sameo@linux.intel.com>
Subject: [PATCH v5 16/24] hw: acpi: Fix memory hotplug AML
 generation error
Date: Mon,  5 Nov 2018 02:40:39 +0100
Message-ID: <20181105014047.26447-17-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j2jf=nq=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gJTuz-0004D7-P8
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 01:43:05 +0000
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogWWFuZyBaaG9uZyA8eWFuZy56aG9uZ0BpbnRlbC5jb20+CgpXaGVuIHVzaW5nIHRoZSBn
ZW5lcmF0ZWQgbWVtb3J5IGhvdHBsdWcgQU1MLCB0aGUgaWFzbApjb21waWxlciB3b3VsZCBnaXZl
IHRoZSBmb2xsb3dpbmcgZXJyb3I6Cgpkc2R0LmRzbCAyNjY6IFJldHVybiAoTU9TVCAoX1VJRCwg
QXJnMCwgQXJnMSwgQXJnMikpCkVycm9yIDYwODAgLSBDYWxsZWQgbWV0aG9kIHJldHVybnMgbm8g
dmFsdWUgXgoKU2lnbmVkLW9mZi1ieTogWWFuZyBaaG9uZyA8eWFuZy56aG9uZ0BpbnRlbC5jb20+
Ci0tLQogaHcvYWNwaS9tZW1vcnlfaG90cGx1Zy5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9h
Y3BpL21lbW9yeV9ob3RwbHVnLmMgYi9ody9hY3BpL21lbW9yeV9ob3RwbHVnLmMKaW5kZXggZGIy
YzRkZjk2MS4uODkzZmMyYmQyNyAxMDA2NDQKLS0tIGEvaHcvYWNwaS9tZW1vcnlfaG90cGx1Zy5j
CisrKyBiL2h3L2FjcGkvbWVtb3J5X2hvdHBsdWcuYwpAQCAtNjg2LDE1ICs2ODYsMTUgQEAgdm9p
ZCBidWlsZF9tZW1vcnlfaG90cGx1Z19hbWwoQW1sICp0YWJsZSwgdWludDMyX3QgbnJfbWVtLAog
CiAgICAgICAgICAgICBtZXRob2QgPSBhbWxfbWV0aG9kKCJfT1NUIiwgMywgQU1MX05PVFNFUklB
TElaRUQpOwogICAgICAgICAgICAgcyA9IE1FTU9SWV9TTE9UX09TVF9NRVRIT0Q7Ci0gICAgICAg
ICAgICBhbWxfYXBwZW5kKG1ldGhvZCwgYW1sX3JldHVybihhbWxfY2FsbDQoCi0gICAgICAgICAg
ICAgICAgcywgYW1sX25hbWUoIl9VSUQiKSwgYW1sX2FyZygwKSwgYW1sX2FyZygxKSwgYW1sX2Fy
ZygyKQotICAgICAgICAgICAgKSkpOworICAgICAgICAgICAgYW1sX2FwcGVuZChtZXRob2QsCisg
ICAgICAgICAgICAgICAgICAgICAgIGFtbF9jYWxsNChzLCBhbWxfbmFtZSgiX1VJRCIpLCBhbWxf
YXJnKDApLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW1sX2FyZygxKSwgYW1s
X2FyZygyKSkpOwogICAgICAgICAgICAgYW1sX2FwcGVuZChkZXYsIG1ldGhvZCk7CiAKICAgICAg
ICAgICAgIG1ldGhvZCA9IGFtbF9tZXRob2QoIl9FSjAiLCAxLCBBTUxfTk9UU0VSSUFMSVpFRCk7
CiAgICAgICAgICAgICBzID0gTUVNT1JZX1NMT1RfRUpFQ1RfTUVUSE9EOwotICAgICAgICAgICAg
YW1sX2FwcGVuZChtZXRob2QsIGFtbF9yZXR1cm4oYW1sX2NhbGwyKAotICAgICAgICAgICAgICAg
ICAgICAgICBzLCBhbWxfbmFtZSgiX1VJRCIpLCBhbWxfYXJnKDApKSkpOworICAgICAgICAgICAg
YW1sX2FwcGVuZChtZXRob2QsCisgICAgICAgICAgICAgICAgICAgICAgIGFtbF9jYWxsMihzLCBh
bWxfbmFtZSgiX1VJRCIpLCBhbWxfYXJnKDApKSk7CiAgICAgICAgICAgICBhbWxfYXBwZW5kKGRl
diwgbWV0aG9kKTsKIAogICAgICAgICAgICAgYW1sX2FwcGVuZChkZXZfY29udGFpbmVyLCBkZXYp
OwotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
