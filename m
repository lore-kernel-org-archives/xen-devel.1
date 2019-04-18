From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 08/21] starvation: Teach
 sg-execute-flight about job state starved
Date: Thu, 18 Apr 2019 17:31:45 +0100
Message-ID: <20190418163158.11408-9-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xH-0001zM-Vp
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:08 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SXQgbmVlZHMgdG8gbm90IG1pbmQgaWYgYSBqb2IgcmVwb3J0cyBhcyBgc3RhcnZlZCcsIGV2ZW4g
aWYgc2ctcnVuLWpvYgpleGl0ZWQgbm9uLXplcm8uCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBzZy1leGVjdXRlLWZsaWdodCB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3NnLWV4ZWN1dGUtZmxpZ2h0IGIvc2ctZXhlY3V0ZS1mbGlnaHQKaW5kZXggYWVkOTgy
M2QuLjAyZjYzMzE2IDEwMDc1NQotLS0gYS9zZy1leGVjdXRlLWZsaWdodAorKysgYi9zZy1leGVj
dXRlLWZsaWdodApAQCAtMTg5LDcgKzE4OSw3IEBAIHByb2MgbWFpbl9pdGVyYXRpb24ge30gewog
ICAgICAgICBpZiB7ISRmb3VuZH0geyBlcnJvciAiam9iIG5vdCBpbiBkYXRhYmFzZSAkZmxpZ2h0
ICRqb2IiIH0KIAogICAgICAgICBzd2l0Y2ggLWV4YWN0IC0tICRqb2JpbmZvKHN0YXR1cykgewot
ICAgICAgICAgICAgcGFzcyAtIGZhaWwgLSBicm9rZW4gLSBibG9ja2VkIC0gdHJ1bmNhdGVkIHsK
KyAgICAgICAgICAgIHBhc3MgLSBmYWlsIC0gYnJva2VuIC0gYmxvY2tlZCAtIHRydW5jYXRlZCAt
IHN0YXJ2ZWQgewogICAgICAgICAgICAgfQogICAgICAgICAgICAgcXVldWVkIC0gcHJlcGFyaW5n
IC0gcnVubmluZyB7CiAgICAgICAgICAgICAgICAgam9iZGI6OmpvYi1zZXQtc3RhdHVzLXVubG9j
a2VkICRmbGlnaHQgJGpvYiBicm9rZW4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
