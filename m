From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 16/18] pygrub fsimage.so: Honour LDFLAGS when
 building
Date: Fri,  5 Oct 2018 18:29:15 +0100
Message-ID: <20181005172917.11963-17-ian.jackson@citrix.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvwj=mr=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1g8U3G-0005vO-5I
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 17:38:10 +0000
In-Reply-To: <20181005172917.11963-1-ian.jackson@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Hans van Kranenburg <hans@knorrie.org>, Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZWVtcyB0byBoYXZlIGJlZW4gc2ltcGx5IG9taXR0ZWQuICBPYnZpb3VzbHkgdGhpcyBp
cyBuZWVkZWQgd2hlbgpidWlsZGluZyBhbmQgbm90IGp1c3Qgd2hlbiBpbnN0YWxsaW5nLiAgUGFz
c2luZyBvbmx5IHdoZW4gaW5zdGFsbGluZwppcyBpbmVmZmVjdGl2ZS4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPgotLS0KIHRvb2xzL3B5Z3J1Yi9N
YWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3B5Z3J1Yi9NYWtlZmlsZSBiL3Rvb2xzL3B5Z3J1Yi9N
YWtlZmlsZQppbmRleCA1MzZhZjA3OTMyLi4zMDYzYzQ5OThmIDEwMDY0NAotLS0gYS90b29scy9w
eWdydWIvTWFrZWZpbGUKKysrIGIvdG9vbHMvcHlncnViL01ha2VmaWxlCkBAIC0xMCw3ICsxMCw3
IEBAIElOU1RBTExfTE9HID0gYnVpbGQvaW5zdGFsbGVkX2ZpbGVzLnR4dAogYWxsOiBidWlsZAog
LlBIT05ZOiBidWlsZAogYnVpbGQ6Ci0JQ0M9IiQoQ0MpIiBDRkxBR1M9IiQoUFlfQ0ZMQUdTKSIg
JChQWVRIT04pIHNldHVwLnB5IGJ1aWxkCisJQ0M9IiQoQ0MpIiBDRkxBR1M9IiQoUFlfQ0ZMQUdT
KSIgTERGTEFHUz0iJChQWV9MREZMQUdTKSIgJChQWVRIT04pIHNldHVwLnB5IGJ1aWxkCiAKIC5Q
SE9OWTogaW5zdGFsbAogaW5zdGFsbDogYWxsCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
