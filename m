From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [stable] xen/pciback: Don't disable PCI_COMMAND on
 PCI device reset.
Date: Thu, 30 May 2019 19:02:34 -0700
Message-ID: <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
References: <1559229415.24330.2.camel@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/r8X=T7=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1hWWsg-0008Ku-R2
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 02:02:54 +0000
In-Reply-To: <1559229415.24330.2.camel@codethink.co.uk>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
Cc: Prarit Bhargava <prarit@redhat.com>, Juergen Gross <jgross@suse.com>, stable <stable@vger.kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gNS8zMC8xOSA4OjE2IEFNLCBCZW4gSHV0Y2hpbmdzIHdyb3RlOgo+IEknbSBsb29raW5nIGF0
IENWRS0yMDE1LTg1NTMgd2hpY2ggaXMgZml4ZWQgYnk6Cj4gCj4gY29tbWl0IDc2ODFmMzFlYzlj
ZGFjYWI0ZmQxMDU3MGJlOTI0ZjJjZWY2NjY5YmEKPiBBdXRob3I6IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBEYXRlOsKgwqDCoFdlZCBGZWIgMTMgMTg6
MjE6MzEgMjAxOSAtMDUwMAo+IAo+ICDCoMKgwqDCoHhlbi9wY2liYWNrOiBEb24ndCBkaXNhYmxl
IFBDSV9DT01NQU5EIG9uIFBDSSBkZXZpY2UgcmVzZXQuCj4gCj4gSSdtIGF3YXJlIHRoYXQgdGhp
cyBjaGFuZ2UgaXMgaW5jb21wYXRpYmxlIHdpdGggcWVtdSA8IDIuNSwgYnV0IHRoYXQncwo+IG5v
dyBxdWl0ZSBvbGQuICBEbyB5b3UgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gYXBwbHkgdGhpcyBj
aGFuZ2UgdG8KPiBzb21lIHN0YWJsZSBicmFuY2hlcz8KPiAKPiBCZW4uCj4gCgpIZXkgQmVuLAoK
PHNocnVncz4gTXkgb3BpbmlvbiBpcyB0byBkcm9wIGl0LCBidXQgaWYgSnVlcmdlbiB0aGlua3Mg
aXQgbWFrZXMgc2Vuc2UgCnRvIGJhY2twb3J0IEkgYW0gbm90IGdvaW5nIHRvIGFyZ3VlLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
