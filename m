From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] xen: Introduce shared buffer helpers
 for page directory...
Date: Fri, 30 Nov 2018 07:50:11 +0100
Message-ID: <f802385f-3c78-2804-9e47-b590a9580955__30643.6730003499$1543560553$gmane$org@suse.com>
References: <20181122100230.14976-1-andr2000@gmail.com>
 <133b948f-fc31-4505-0b85-5fc7a7beb559@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7TZB=OJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gSccy-0007mI-8M
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 06:50:16 +0000
In-Reply-To: <133b948f-fc31-4505-0b85-5fc7a7beb559@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMTEvMjAxOCAxMjoyMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gcGlu
Zwo+IAo+IE9uIDExLzIyLzE4IDEyOjAyIFBNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToKPj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hl
bmtvQGVwYW0uY29tPgo+Pgo+PiBiYXNlZCBmcm9udGVuZHMuIEN1cnJlbnRseSB0aGUgZnJvbnRl
bmRzIHdoaWNoIGltcGxlbWVudAo+PiBzaW1pbGFyIGNvZGUgZm9yIHNoYXJpbmcgYmlnIGJ1ZmZl
cnMgYmV0d2VlbiBmcm9udGVuZCBhbmQKPj4gYmFja2VuZCBhcmUgcGFyYS12aXJ0dWFsaXplZCBE
Uk0gYW5kIHNvdW5kIGRyaXZlcnMuCj4+IEJvdGggZGVmaW5lIHRoZSBzYW1lIHdheSB0byBzaGFy
ZSBncmFudCByZWZlcmVuY2VzIG9mIGEKPj4gZGF0YSBidWZmZXIgd2l0aCB0aGUgY29ycmVzcG9u
ZGluZyBiYWNrZW5kIHdpdGggbGl0dGxlCj4+IGRpZmZlcmVuY2VzLgo+Pgo+PiBNb3ZlIHNoYXJl
ZCBjb2RlIGludG8gYSBoZWxwZXIgbW9kdWxlLCBzbyB0aGVyZSBpcyBhIHNpbmdsZQo+PiBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IGZvciBhbGwuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5r
b0BlcGFtLmNvbT4KCkluIGdlbmVyYWwgSSdtIGZpbmUgd2l0aCB0aGlzIGFwcHJvYWNoLgoKV2l0
aCB0aGUgY29uY2VybnMgcmFpc2VkIGZvciBvbmUgb2YgdGhlIG90aGVyIHBhdGNoZXMgSSB3YW50
ZWQgdG8gd2FpdApmb3IgVjIgb2YgdGhlIHNlcmllcy4gT3Igd29uJ3QgdGhlIHJlc3VsdGluZyBj
aGFuZ2UgcmVxdWlyZSBhCm1vZGlmaWNhdGlvbiBvZiB0aGlzIHBhdGNoPwoKSXQgd291bGQgYmUg
bmljZSBpZiB5b3UgY291bGQgcG9pbnQgb3V0IGluIHRoZSBjb21taXQgbWVzc2FnZSB3aGV0aGVy
CnlvdSBhcmUgZG9pbmcgY29kZSBtb3ZlbWVudCAod2l0aCBzb21lIHJlbmFtZXMpIG9ubHksIG9y
IGlmIHRoZXJlIGFyZQphbnkgZnVuY3Rpb25hbCBjaGFuZ2VzIGludm9sdmVkIChhbmQgd2hpY2gg
b25lcykuIFRoaXMgd291bGQgbWFrZSB0aGUKcmV2aWV3IG11Y2ggZWFzaWVyIGFuZCBsZXNzIHRp
bWUgY29uc3VtaW5nLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
