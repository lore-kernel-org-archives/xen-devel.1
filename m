From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V2 3/3] xen/arm: Add SCIFA UART support for
 early printk
Date: Mon, 18 Feb 2019 14:05:11 +0000
Message-ID: <c3ae0a46-8418-c426-c87a-96f30730bbda@arm.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-4-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BVaE=QZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gvjXp-0008S9-Ha
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 14:05:17 +0000
In-Reply-To: <1549024652-24805-4-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMS8wMi8yMDE5IDEyOjM3LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPiBG
cm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
Cj4gCj4gQWRkIHN1cHBvcnQgZm9yIFJlbmVzYXMgIlN0b3V0IiBkZXZlbG9wbWVudCBib2FyZCBi
YXNlZCBvbgo+IFItQ2FyIEgyIFNvQyB3aGljaCBoYXMgU0NJRkEgY29tcGF0aWJsZSBVQVJULgo+
IAo+IEFjdHVhbGx5IGV4aXN0aW5nIFNDSUYgVUFSVCBzdXBwb3J0IChkZWJ1Zy1zY2lmLmluYykg
YW5kCj4gbmV3bHkgYWRkZWQgU0NJRkEgVUFSVCBzdXBwb3J0IChkZWJ1Zy1zY2lmYS5pbmMpIGRp
ZmZlciBvbmx5Cj4gaW4gcmVnaXN0ZXJzIG9mZnNldHMuCgpDYW4gd2UgdHJ5IHRvIG1lcmdlIHRo
ZSB0d28gdGhlbj8gT25lIHNvbHV0aW9uIGlzIHRvIHByb3ZpZGUgYW5vdGhlciBvcHRpb25zIApz
aW1pbGFyIHRvIGhvdyB3ZSBkZWFsIHdpdGggUkVHX1NISUZUIG9uIHRoZSA4MjUwLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
