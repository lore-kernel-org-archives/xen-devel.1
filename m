From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] xen/scsiback: add error handling for
 xenbus_printf
Date: Tue, 19 Jun 2018 15:01:59 +0200
Message-ID: <35ba30c8-b93a-8187-9cd9-95abdd307301__7420.82344736463$1529413249$gmane$org@suse.com>
References: <1528775185-39467-1-git-send-email-jiazhouyang09@gmail.com>
 <1529108077-60035-1-git-send-email-jiazhouyang09@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=4s9a=jf=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fVGGo-0008D8-V1
 for xen-devel@lists.xenproject.org; Tue, 19 Jun 2018 13:02:02 +0000
In-Reply-To: <1529108077-60035-1-git-send-email-jiazhouyang09@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDYvMTggMDI6MTQsIFpob3V5YW5nIEppYSB3cm90ZToKPiBXaGVuIHhlbmJ1c19wcmlu
dGYgZmFpbHMsIHRoZSBsYWNrIG9mIGVycm9yLWhhbmRsaW5nIGNvZGUgbWF5Cj4gY2F1c2UgdW5l
eHBlY3RlZCByZXN1bHRzLgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBlcnJvci1oYW5kbGluZyBjb2Rl
IGFmdGVyIGNhbGxpbmcgeGVuYnVzX3ByaW50Zi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaG91eWFu
ZyBKaWEgPGppYXpob3V5YW5nMDlAZ21haWwuY29tPgoKUHVzaGVkIHRvIHhlbi90aXAuZ2l0IGZv
ci1saW51cy00LjE4CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
