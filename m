From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: Re: [PATCH] xen: xenbus: Fix a possible data race in
 xs_request_enter
Date: Tue, 8 May 2018 15:04:13 +0800
Message-ID: <770bc26b-3819-2235-132f-55b0319955dd__49862.7854315147$1525762985$gmane$org@gmail.com>
References: <20180508033429.12749-1-baijiaju1990@gmail.com>
 <ea5634a2-b0e2-0fac-e5ec-cef1083958fe@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3we0=h3=gmail.com=baijiaju1990@srs-us1.protection.inumbo.net>)
 id 1fFwfe-0001h8-OW
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 07:04:22 +0000
Received: by mail-pf0-x235.google.com with SMTP id w129so18080123pfd.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 May 2018 00:04:20 -0700 (PDT)
In-Reply-To: <ea5634a2-b0e2-0fac-e5ec-cef1083958fe@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, simon@invisiblethingslab.com, joao.m.martins@oracle.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMDE4LzUvOCAxNTowMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwOC8wNS8xOCAw
NTozNCwgSmlhLUp1IEJhaSB3cm90ZToKPj4gVGhlIHJlYWQgb3BlcmF0aW9uIHRvICJyZXEtPnR5
cGUiIGlzIHByb3RlY3RlZCBieQo+PiB0aGUgbG9jayBvbiBsaW5lIDEyOCwgYnV0IHRoZSB3cml0
ZSBvcGVyYXRpb24gdG8KPj4gdGhpcyBkYXRhIG9uIGxpbmUgMTE4IGlzIG5vdCBwcm90ZWN0ZWQg
YnkgdGhlIGxvY2suCj4+IFRodXMsIHRoZXJlIG1heSBleGlzdCBhIGRhdGEgcmFjZSBmb3IgInJl
cS0+dHlwZSIuCj4+Cj4+IFRvIGZpeCB0aGlzIGRhdGEgcmFjZSwgdGhlIHdyaXRlIG9wZXJhdGlv
biB0byAicmVxLT50eXBlIgo+PiBzaG91bGQgYmUgYWxzbyBwcm90ZWN0ZWQgYnkgdGhlIGxvY2su
Cj4gTm8sIHhzX3JlcXVlc3RfZW50ZXIoKSBpcyBuZXZlciBjYWxsZWQgZm9yIGEgcmVxdWVzdCBh
bHJlYWR5IHZpc2libGUgdG8KPiBhbm90aGVyIHRocmVhZCBvciBwcm9jZXNzb3IuIFNvIG5vIHJh
Y2UgZXhpc3RzLgoKT2theSwgdGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKCkJlc3Qgd2lzaGVzLApK
aWEtSnUgQmFpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
