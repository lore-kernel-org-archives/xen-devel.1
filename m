From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 7/8] PM / Hibernate: use pfn_to_online_page()
Date: Mon, 19 Nov 2018 11:16:15 +0100
Message-ID: <20181119101616.8901-8-david__31799.3940705948$1542622560$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Bx+7=N6=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gOgcG-0006Fl-Bx
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 10:17:16 +0000
In-Reply-To: <20181119101616.8901-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Len Brown <len.brown@intel.com>, Michal Hocko <mhocko@suse.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

TGV0J3MgdXNlIHBmbl90b19vbmxpbmVfcGFnZSgpIGluc3RlYWQgb2YgcGZuX3RvX3BhZ2UoKSB3
aGVuIGNoZWNraW5nCmZvciBzYXZlYWJsZSBwYWdlcyB0byBub3Qgc2F2ZS9yZXN0b3JlIG9mZmxp
bmUgbWVtb3J5IHNlY3Rpb25zLgoKQ2M6ICJSYWZhZWwgSi4gV3lzb2NraSIgPHJqd0Byand5c29j
a2kubmV0PgpDYzogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+CkNjOiBMZW4gQnJvd24gPGxl
bi5icm93bkBpbnRlbC5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRp
b24ub3JnPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBNaWNo
YWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RA
cmVkaGF0LmNvbT4KU3VnZ2VzdGVkLWJ5OiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BrZXJuZWwub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KLS0t
CiBrZXJuZWwvcG93ZXIvc25hcHNob3QuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL3Bvd2Vy
L3NuYXBzaG90LmMgYi9rZXJuZWwvcG93ZXIvc25hcHNob3QuYwppbmRleCA2NDBiMjAzNGVkZDYu
Ljg3ZTZkZDU3ODE5ZiAxMDA2NDQKLS0tIGEva2VybmVsL3Bvd2VyL3NuYXBzaG90LmMKKysrIGIv
a2VybmVsL3Bvd2VyL3NuYXBzaG90LmMKQEAgLTEyMTUsOCArMTIxNSw4IEBAIHN0YXRpYyBzdHJ1
Y3QgcGFnZSAqc2F2ZWFibGVfaGlnaG1lbV9wYWdlKHN0cnVjdCB6b25lICp6b25lLCB1bnNpZ25l
ZCBsb25nIHBmbikKIAlpZiAoIXBmbl92YWxpZChwZm4pKQogCQlyZXR1cm4gTlVMTDsKIAotCXBh
Z2UgPSBwZm5fdG9fcGFnZShwZm4pOwotCWlmIChwYWdlX3pvbmUocGFnZSkgIT0gem9uZSkKKwlw
YWdlID0gcGZuX3RvX29ubGluZV9wYWdlKHBmbik7CisJaWYgKCFwYWdlIHx8IHBhZ2Vfem9uZShw
YWdlKSAhPSB6b25lKQogCQlyZXR1cm4gTlVMTDsKIAogCUJVR19PTighUGFnZUhpZ2hNZW0ocGFn
ZSkpOwpAQCAtMTI3Nyw4ICsxMjc3LDggQEAgc3RhdGljIHN0cnVjdCBwYWdlICpzYXZlYWJsZV9w
YWdlKHN0cnVjdCB6b25lICp6b25lLCB1bnNpZ25lZCBsb25nIHBmbikKIAlpZiAoIXBmbl92YWxp
ZChwZm4pKQogCQlyZXR1cm4gTlVMTDsKIAotCXBhZ2UgPSBwZm5fdG9fcGFnZShwZm4pOwotCWlm
IChwYWdlX3pvbmUocGFnZSkgIT0gem9uZSkKKwlwYWdlID0gcGZuX3RvX29ubGluZV9wYWdlKHBm
bik7CisJaWYgKCFwYWdlIHx8IHBhZ2Vfem9uZShwYWdlKSAhPSB6b25lKQogCQlyZXR1cm4gTlVM
TDsKIAogCUJVR19PTihQYWdlSGlnaE1lbShwYWdlKSk7Ci0tIAoyLjE3LjIKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
