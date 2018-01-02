From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen/time: fix section mismatch for
 xen_init_time_ops()
Date: Tue, 2 Jan 2018 15:24:55 +0100
Message-ID: <d5314269-6d7e-d496-695f-af59bc41f554__18079.854900907$1514903038$gmane$org@suse.com>
References: <1514083813-27047-1-git-send-email-nick.desaulniers@gmail.com>
 <52b547c5-509a-3a82-12cd-4d9d0a06b53f@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dfvk=d5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eWNV4-0007Il-KP
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 14:25:06 +0000
In-Reply-To: <52b547c5-509a-3a82-12cd-4d9d0a06b53f@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDEvMTggMTU6MTgsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAxMi8yMy8yMDE3
IDA5OjUwIFBNLCBOaWNrIERlc2F1bG5pZXJzIHdyb3RlOgo+PiBUaGUgaGVhZGVyIGRlY2xhcmVz
IHRoaXMgZnVuY3Rpb24gYXMgX19pbml0IGJ1dCBpcyBkZWZpbmVkIGluIF9fcmVmCj4+IHNlY3Rp
b24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5pY2suZGVzYXVsbmll
cnNAZ21haWwuY29tPgo+IAo+IEFGQUlLIHNlY3Rpb24gYXR0cmlidXRlcyBpbiBoZWFkZXIgZmls
ZXMgYXJlIGlnbm9yZWQgYnkgY29tcGlsZXIgYW55d2F5Cj4gc28gSSdkIHJlbW92ZSBhbGwgb2Yg
dGhlbS4KCkhtbSwgSSdtIG5vdCBzdXJlIGFsbCBmdXR1cmUgY29tcGlsZXJzIHdpbGwgaWdub3Jl
IHRoZSBzZWN0aW9uCmF0dHJpYnV0ZXMuIGluY2x1ZGUvbGludXgvaW5pdC5oIGV4cGxpY3RpbHkg
bWVudGlvbnMgd2hlcmUgdG8gcHV0CnRoZSBhdHRydWJ1dGUgaW4gYSBwcm90b3R5cGUsIHNvIEkn
ZCByYXRoZXIga2VlcCBpdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
