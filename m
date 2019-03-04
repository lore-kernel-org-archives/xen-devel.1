From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] xen: avoid link error on ARM
Date: Mon, 4 Mar 2019 22:23:11 +0100
Message-ID: <CAK8P3a1NXXNBUzb7tHtF6ohCcR+_rFhxXSd3ziSmnkhg7bdrpA__39933.3189868898$1551734668$gmane$org@mail.gmail.com>
References: <20190304204826.2414365-1-arnd@arndb.de>
 <7b1ae554-8d23-a282-4175-37e6743d0290@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gAeh=RH=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1h0v3Z-0001XR-8j
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 21:23:29 +0000
Received: by mail-qt1-f195.google.com with SMTP id z25so6741961qti.13
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2019 13:23:28 -0800 (PST)
In-Reply-To: <7b1ae554-8d23-a282-4175-37e6743d0290@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Paul Durrant <paul.durrant@citrix.com>, Souptick Joarder <jrdr.linux@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgNCwgMjAxOSBhdCAxMDoxOSBQTSBCb3JpcyBPc3Ryb3Zza3kKPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToKPgo+IE9uIDMvNC8xOSAzOjQ3IFBNLCBBcm5kIEJl
cmdtYW5uIHdyb3RlOgo+ID4gQnVpbGRpbmcgdGhlIHByaXZjbWQgY29kZSBhcyBhIGxvYWRhYmxl
IG1vZHVsZSBvbiBBUk0sIHdlIGdldAo+ID4gYSBsaW5rIGVycm9yIGR1ZSB0byB0aGUgcHJpdmF0
ZSBjYWNoZSBtYW5hZ2VtZW50IGZ1bmN0aW9uczoKPiA+Cj4gPiBFUlJPUjogIl9fc3luY19pY2Fj
aGVfZGNhY2hlIiBbZHJpdmVycy94ZW4veGVuLXByaXZjbWQua29dIHVuZGVmaW5lZCEKPgo+IENh
biBfX3N5bmNfaWNhY2hlX2RjYWNoZSBiZSBleHBvcnRlZCBpbiBhcm0zMiwganVzdCBsaWtlIGl0
IGlzIGluIGFybTY0PwoKUnVzc2VsbCB3YW50cyBhbGwgY2FjaGUgbWFuYWdlbWVudCBvcGVyYXRp
b25zIHRvIHN0YXkgcHJpdmF0ZSB0byB0aGUKa2VybmVsLCBhcyB0aGV5IHRlbmQgdG8gZ2V0IGFi
dXNlZCBieSBvdGhlciBkcml2ZXJzOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJt
LWtlcm5lbC8yMDE4MTIxODEwMDkwOC5HTDI2MDkwQG4yMTAwLmFybWxpbnV4Lm9yZy51ay8KCiAg
ICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
