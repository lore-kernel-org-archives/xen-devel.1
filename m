From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/timers: Fix memory leak with cpu
 unplug/plug
Date: Mon, 8 Apr 2019 11:39:16 +0100
Message-ID: <5394e8aa-bae4-8a27-327a-b0dcd0996477@arm.com>
References: <1554716396-3764-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554716396-3764-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA0LzgvMTkgMTA6MzkgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gKyAgICBjYXNl
IENQVV9SRVNVTUVfRkFJTEVEOgo+ICsgICAgICAgIGlmICggIXBhcmtfb2ZmbGluZV9jcHVzICYm
IHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfc3VzcGVuZCApCgpUaGlzIHBhdGNoIGJyZWFrcyBj
b21waWxhdGlvbiBvbiBhcm0zMi9hcm02NCBiZWNhdXNlIHBhcmtfb2ZmbGluZV9jcHVzIAppcyBu
b3QgZGVmaW5lZDoKCnRpbWVyLmM6IEluIGZ1bmN0aW9uICdjcHVfY2FsbGJhY2snOgp0aW1lci5j
OjY1MToxNTogZXJyb3I6ICdwYXJrX29mZmxpbmVfY3B1cycgdW5kZWNsYXJlZCAoZmlyc3QgdXNl
IGluIHRoaXMgCmZ1bmN0aW9uKQogICAgICAgICAgaWYgKCAhcGFya19vZmZsaW5lX2NwdXMgJiYg
c3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9zdXNwZW5kICkKICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+CgpXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHBhcmtfb2ZmbGluZV9jcHVzPwoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
