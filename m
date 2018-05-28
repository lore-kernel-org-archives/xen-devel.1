From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Debug guest state (VMI)
Date: Mon, 28 May 2018 11:24:35 -0400
Message-ID: <nIdELnuFP9rWipBnb_gApHh3Lmd3Y9uZ9PKSRXZNc8-0jOcGAAnqqwthgx94gxwHcfSxhQkUKeaRgR_ywvY7f2yl7RtWGTtas3qcqxi4uhI=@protonmail.com>
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wy0b=ip=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1fNK0y-0004KE-8N
 for xen-devel@lists.xenproject.org; Mon, 28 May 2018 15:24:52 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgIQoKSSdtIHBsYXlpbmcgd2l0aCB0aGUgVk1JIEFQSXMgdXNpbmcgTGliVk1JLCBhbmQgaSBu
ZWVkIHRvIHRyYWNrIGRvd24KYSBidWcgdGhhdCBpIHJlcG9ydGVkIGhlcmU6Cmh0dHBzOi8vZ2l0
aHViLmNvbS9saWJ2bWkvbGlidm1pL2lzc3Vlcy82MjEKCkJhc2ljYWxseSB0aGUgZG9tYWluIGlz
IHN0aWxsIHBhdXNlZCBldmVuIHRob3VnaHQgaSBjYWxsZWQgdGhlIHJpZ2h0IEFQSQp0byByZXN1
bWUgaXQgYW5kIHRoZSBldmVudCBidWZmZXIgaXMgc3VwcG9zZWQgdG8gYmUgZW1wdHkuCgpOb3cg
dGhlcmUgYXJlIDIgcG9zc2liaWxpdGllcwotIGVpdGhlciB0aGVyZSBpcyBhbiBldmVudCBpbiB0
aGUgYnVmZmVyIHdhaXRpbmcgdG8gYmUgcHJvY2Vzc2VkCi0gb3IgdGhlIHJlc3VtZV92bSBmdW5j
dGlvbiBmYWlsZWQKCklzIHRoZXJlIGEgd2F5IHRvIHRyYWNrIHRoZSBzdGF0ZSBvZiB0aGUgZ3Vl
c3QgVk1JIGV2ZW50IGJ1ZmZlciA/Cih3aGF0IGV2ZW50cyBhcmUgcmVnaXN0ZXJlZCkKCklzIHRo
ZXJlIGEgd2F5IHRvIHNlZSB0aGUgcGF1c2UvcmVzdW1lIG9wZXJhdGlvbnMgaW4gYSBndWVzdCBs
b2cgZmlsZSA/CgpJIGZvdW5kIHNvbWUgZG9jdW1lbnRhdGlvbiBvbjoKaHR0cHM6Ly93aWtpLnhl
bnByb2plY3Qub3JnL3dpa2kvUmVwb3J0aW5nX0J1Z3NfYWdhaW5zdF9YZW5fUHJvamVjdAoKdXNp
bmcgWEVOQ09OU09MRURfVFJBQ0U9Z3Vlc3QKdG8gcHV0IGluIC9ldGMvZGVmYXVsdC94ZW5jb21t
b25zCgpIb3dldmVyLCBpIGRvbid0IGhhdmUgYSBzZXJ2aWNlIG5hbWVkIHhlbmNvbnNvbGVkLnNl
cnZpY2UKcnVubmluZyBvbiBteSBlbnZpcm9ubWVudCA/PwoKLT4gSXMgdGhlcmUgYSBnZW5lcmFs
IHBhZ2Ugb24gdGhlIFdpa2kgd2hpY2ggZXhwbGFpbnMgd2hlcmUgYXJlIHRoZSBsb2cKZmlsZSBh
bmQgaG93IHRvIGRlYnVnIHRoZSBndWVzdHMgYW5kIGRvbTAgPwoKSSdtIHVzaW5nIFhlbiA0Ljku
MiBvbiBVYnVudHUgQmlvbmljLgoKVGhhbmtzIGZvciB5b3VyIGhlbHAgIQoK4oCLLS0KCk1hdGhp
ZXUgVGFycmFsClNlbnQgd2l0aCBQcm90b25NYWlsIFNlY3VyZSBFbWFpbC7igIsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
