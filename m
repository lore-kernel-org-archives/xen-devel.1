From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/9] vm_event: Simplify vm_event interface
Date: Fri, 31 May 2019 17:06:57 -0700
Message-ID: <5e29c821-8812-9fc9-1fc1-88dd4a04fb31@citrix.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <922965b261f4ca23bcb276d6907f36c892c2478b.1559224640.git.ppircalabu@bitdefender.com>
 <12a39c6e-6e4e-1bbe-47e4-ad13769acdae@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fs4O=UA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWrY8-0006xF-8h
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2019 00:07:04 +0000
In-Reply-To: <12a39c6e-6e4e-1bbe-47e4-ad13769acdae@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMjAxOSAxNjo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8wNS8yMDE5
IDA3OjE4LCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6Cj4+IFRoZSBkb21haW4gcmVmZXJlbmNlIGNh
biBiZSBwYXJ0IG9mIHRoZSB2bV9ldmVudF9kb21haW4gc3RydWN0dXJlCj4+IGJlY2F1c2UgZm9y
IGV2ZXJ5IGNhbGwgdG8gYSB2bV9ldmVudCBpbnRlcmZhY2UgZnVuY3Rpb24gYm90aCB0aGUgbGF0
dGVyCj4+IGFuZCBpdCdzIGNvcnJlc3BvbmRpbmcgZG9tYWluIGFyZSBwYXNzZWQgYXMgcGFyYW1l
dGVycy4KPiBJdCBjYW4sIGJ1dCB3aHkgaXMgYWRkaW5nIGEgYmFja3BvaW50ZXIgaGVscGZ1bD8K
Pgo+IEkgYXNrIGJlY2F1c2UgSSBzZWUgNSByZWFkcyBvZiB2ZWQtPmQsIGFuZCBub3RoaW5nIHdo
aWNoIGV2ZXIKPiBpbml0aWFsaXNlcyBpdC4KClAuUy4gSSd2ZSBmaW5hbGx5IGZvdW5kIHRoZSBp
bml0aWFsaXNhdGlvbiBpbiBwYXRjaCA3LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
