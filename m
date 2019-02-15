From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/2] xen/gntdev: Check and release imported
 dma-bufs on close
Date: Fri, 15 Feb 2019 10:06:31 -0500
Message-ID: <2e0c430d-9dc6-e6c3-9ff8-7c59358aed32__31406.7114655458$1550243267$gmane$org@oracle.com>
References: <20190214142321.1138-1-andr2000@gmail.com>
 <20190214142321.1138-2-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NTNL=QW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1guf4k-0006Yr-M0
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 15:06:50 +0000
In-Reply-To: <20190214142321.1138-2-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, jgross@suse.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xNC8xOSA5OjIzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPiBGcm9t
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+Cj4KPiBDaGVjayBpZiB0aGVyZSBhcmUgYW55IGltcG9ydGVkIGRtYS1idWZzIGxlZnQgbm90
IHJlbGVhc2VkIGJ5Cj4gdXNlci1zcGFjZSB3aGVuIGdyYW50IGRldmljZSdzIHJlbGVhc2UgY2Fs
bGJhY2sgaXMgY2FsbGVkIGFuZAo+IGZyZWUgdGhvc2UgaWYgdGhpcyBpcyB0aGUgY2FzZS4gVGhp
cyBjYW4gaGFwcGVuIGlmIHVzZXItc3BhY2UKPiBsZWFrcyB0aGUgYnVmZmVycyBiZWNhdXNlIG9m
IGEgYnVnIG9yIGFwcGxpY2F0aW9uIGhhcyBiZWVuCj4gdGVybWluYXRlZCBmb3IgYW55IHJlYXNv
bi4KPgo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3lAb3Jh
Y2xlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
