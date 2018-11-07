From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: Guest soft lockups with "xen: make xen_qlock_wait()
 nestable"
Date: Wed, 7 Nov 2018 17:34:07 -0500
Message-ID: <9db95104-1378-f40e-db3a-8ccd2aa89b9f@oracle.com>
References: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k86m=ns=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gKWP4-0006jj-9H
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 22:34:26 +0000
In-Reply-To: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>, Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvNy8xOCA0OjMwIEFNLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4gSGkgSnVlcmdl
biAvIEJvcmlzLAo+Cj4gTGFzdCB3ZWVrIGkgdGVzdGVkIExpbnV4IGtlcm5lbCA0LjE5LjAgc3Rh
YmxlIHdpdGggdGhlIFhlbiAiZm9yLWxpbnVzLTQuMjAiIGJyYW5jaCBwdWxsZWQgb24gdG9wLgo+
IFVuZm9ydHVuYXRlbHkgaSB3YXMgc2VlaW5nIGd1ZXN0cyBsb2NrdXAgYWZ0ZXIgc29tZSB0aW1l
LCBzZWUgYmVsb3cgZm9yIHRoZSBsb2dnaW5nIGZyb20gb25lIG9mIHRoZSBndWVzdAo+IHdoaWNo
IGkgd2FzIGFibGUgdG8gY2FwdHVyZS4KPiBSZXZlcnRpbmcgInhlbjogbWFrZSB4ZW5fcWxvY2tf
d2FpdCgpIG5lc3RhYmxlIiA3MjUwZjZkMzU2ODFkZmM0NDc0OWQ5MDU5OGEyZDUxYTExOGNlMmI4
LAo+IG1hZGUgdGhlIGxvY2t1cHMgZGlzYXBwZWFyLgo+Cj4gVGhlc2UgZ3Vlc3RzIGFyZSBzdHJl
c3NlZCBxdWl0ZSBoYXJkIGluIGJvdGggQ1BVIGFuZCBuZXR3b3JraW5nLCAKPiBzbyB0aGV5IGFy
ZSBwcm9iYWJseSBtb3JlIHN1c2NlcHRpYmxlIHRvIGxvY2tpbmcgaXNzdWVzLgo+Cj4gU3lzdGVt
IGlzIGEgQU1EIHBoZW5vbSB4NiwgcnVubmluZyBYZW4tdW5zdGFibGUuCj4KPiBBbnkgaWRlYXMg
PwoKCkJ5IGFueSBjaGFuY2UsIGlzIFZNUFUgb24/CgoKLWJvcmlzCgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
