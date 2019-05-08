From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/2] xen/arm: Misc improvements to
 do_common_cpu_on()
Date: Wed, 8 May 2019 16:46:30 +0100
Message-ID: <30ff3cb3-7d1f-2838-06dc-3b94de3bfebc@arm.com>
References: <1556129458-11418-1-git-send-email-andrew.cooper3@citrix.com>
 <1556129458-11418-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7fFX=TI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOOmA-0005Cs-AN
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 15:46:34 +0000
In-Reply-To: <1556129458-11418-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMjQvMDQvMjAxOSAxOToxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAg
ICogVXNlIGRvbWFpbl92Y3B1KCkgcmF0aGVyIHRoYW4gb3BlbmNvZGluZyB0aGUgbG9va3VwLiAg
QW1vbmdzdCBvdGhlciB0aGluZ3MsCj4gICAgIGRvbWFpbl92Y3B1KCkgaXMgc3BlY3RyZS12MS1z
YWZlLgo+ICAgKiBVbmxvY2sgdGhlIGRvbWFpbiBpbW1lZGlhdGVseSBhZnRlciBhcmNoX3NldF9p
bmZvX2d1ZXN0KCkgY29tcGxldGVzLiAgVGhlcmUKPiAgICAgaXMgbm8gbmVlZCBmb3IgZnJlZV92
Y3B1X2d1ZXN0X2NvbnRleHQoKSB0byBiZSB3aXRoaW4gdGhlIGNyaXRpY2FsIHJlZ2lvbiwKPiAg
ICAgYW5kIG1vdmluZyB0aGUgY2FsbCBzaW1wbGlmaWVzIHRoZSBlcnJvciBjYXNlLgo+IAo+IE5v
IHByYWN0aWNhbCBjaGFuZ2UgaW4gZnVuY3Rpb25hbHRpeS4KCnMvZnVuY3Rpb25hbHRpeS9mdW5j
dGlvbmFsaXR5LwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgpJIHdpbGwgZml4IHVwIHRoZSB0eXBvIGFuZCBxdWV1ZSBpdCBpbiBteSBuZXh0
LTQuMTMgYnJhbmNoLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
