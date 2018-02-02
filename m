From: Chris Patterson <cjp256@gmail.com>
Subject: Re: [PATCH v2] x86/xen: init %gs very early to avoid
 page faults with stack protector
Date: Thu, 1 Feb 2018 19:36:05 -0500
Message-ID: <CABZSBQcmKBGZ2-i-YRL=Ux6hcAP0peR1zfaVh4Go9vr=JTRThQ__38676.8546574332$1517531757$gmane$org@mail.gmail.com>
References: <20180201124019.11693-1-jgross@suse.com>
 <b8f04374-97f1-76d5-81b5-3583441833f4@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ttoa=e4=gmail.com=cjp256@srs-us1.protection.inumbo.net>)
 id 1ehPLB-0007bp-9u
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 00:36:29 +0000
Received: by mail-it0-x22b.google.com with SMTP id h129so5986515ita.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2018 16:36:26 -0800 (PST)
In-Reply-To: <b8f04374-97f1-76d5-81b5-3583441833f4@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

V29ya3MgZ3JlYXQsIHRlc3RlZCBpdCBhbmQgaXQgZml4ZXMgYm9vdGluZyBMaW51eCB2NC4xNSBr
ZXJuZWwgZm9yIG1lIDopCgpDaGVlcnMhCgpPbiBUaHUsIEZlYiAxLCAyMDE4IGF0IDM6MTcgUE0s
IEJvcmlzIE9zdHJvdnNreQo8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+IE9u
IDAyLzAxLzIwMTggMDc6NDAgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFdoZW4gcnVubmlu
ZyBhcyBYZW4gcHYgZ3Vlc3QgJWdzIGlzIGluaXRpYWxpemVkIHNvbWUgdGltZSBhZnRlcgo+PiBD
IGNvZGUgaXMgc3RhcnRlZC4gRGVwZW5kaW5nIG9uIHN0YWNrIHByb3RlY3RvciB1c2FnZSB0aGlz
IG1pZ2h0IGJlCj4+IHRvbyBsYXRlLCByZXN1bHRpbmcgaW4gcGFnZSBmYXVsdHMuCj4+Cj4+IFNv
IHNldHVwICVncyBhbmQgTVNSX0dTX0JBU0UgaW4gYXNzZW1ibHkgY29kZSBhbHJlYWR5Lgo+Pgo+
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4KPiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxi
b3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
