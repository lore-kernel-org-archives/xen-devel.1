From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen: Clear user %gs before updating
 segment descriptors
Date: Mon, 10 Dec 2018 11:31:44 -0500
Message-ID: <5866ac7b-1f1d-ff77-f0f3-42741e689478@oracle.com>
References: <9ae736ab22cab27e4bc0f98979b0e2dda6c3260a.camel@infradead.org>
 <20181207231526.18644-1-dwmw@amazon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YPmi=OT=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gWOU0-0007A7-Gz
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 16:32:36 +0000
In-Reply-To: <20181207231526.18644-1-dwmw@amazon.co.uk>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw@amazon.co.uk>, Andy Lutomirski <luto@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, xen-devel <xen-devel@lists.xenproject.org>, dwmw2@infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIvNy8xOCA2OjE1IFBNLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4gIAo+IC0JbG9hZF9U
TFNfZGVzY3JpcHRvcih0LCBjcHUsIDApOwo+IC0JbG9hZF9UTFNfZGVzY3JpcHRvcih0LCBjcHUs
IDEpOwo+IC0JbG9hZF9UTFNfZGVzY3JpcHRvcih0LCBjcHUsIDIpOwo+ICsJbG9hZF9UTFNfZGVz
Y3JpcHRvcih0LCBjcHUsIDAsIGZsdXNoX2dzKTsKPiArCWxvYWRfVExTX2Rlc2NyaXB0b3IodCwg
Y3B1LCAxLCBmbHVzaF9ncyk7Cj4gKwlsb2FkX1RMU19kZXNjcmlwdG9yKHQsIGNwdSwgMiwgZmx1
c2hfZ3MpOwoKU2luY2UgeW91IGFyZSBjaGFuZ2luZyB0aGVzZSBsaW5lcyBhbnl3YXksIGNhbiB5
b3UgZG8gYSBsb29wIG92ZXIKWzAuLkdEVF9FTlRSWV9UTFNfRU5UUklFUyk/CgotYm9yaXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
