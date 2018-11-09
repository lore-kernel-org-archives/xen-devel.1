From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] xen/domain: Audit config->max_vcpus
 during {, arch_}check_domain_config()
Date: Fri, 9 Nov 2018 18:44:45 +0000
Message-ID: <3d04b7cf-bf72-40dc-70e7-054367a40d0f@citrix.com>
References: <1538751289-1109-1-git-send-email-andrew.cooper3@citrix.com>
 <1538751289-1109-4-git-send-email-andrew.cooper3@citrix.com>
 <5BBB5F8B02000078001EF9C9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BBB5F8B02000078001EF9C9@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTAvMTggMTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Cj4+IC0tLSBhL3hlbi9jb21t
b24vZG9tYWluLmMKPj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwo+PiBAQCAtMjk3LDYgKzI5
Nyw5IEBAIHN0YXRpYyBpbnQgY2hlY2tfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9j
cmVhdGVkb21haW4gKmNvbmZpZykKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9E
T01DVExfQ0RGX3hzX2RvbWFpbikgKQo+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gIAo+
PiArICAgIGlmICggY29uZmlnLT5tYXhfdmNwdXMgPCAxICkKPj4gKyAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4+ICsKPj4gICAgICByZXR1cm4gYXJjaF9jaGVja19kb21haW5fY29uZmlnKGNvbmZp
Zyk7Cj4+ICB9Cj4gQW55IHJlYXNvbiB5b3UgZG9uJ3QgcmVtb3ZlIHRoZSBub3cgcmVkdW5kYW50
IGNoZWNrIGZyb20KPiBkb21haW5fY3JlYXRlKCksIHdoaWNoIHdvdWxkIGFsbG93IGRpdGNoaW5n
IGFsdG9nZXRoZXIgeDg2J3MKPiBkb21haW5fbWF4X3ZjcHVzKCk/CgpUaGF0J3MgZG9uZSBpbiB0
aGUgbmV4dCBwYXRjaCwgdG8gc2ltcGxpZnkgdGhpcyBvbmUuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
