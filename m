From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] xen: Change return type to vm_fault_t
Date: Thu, 10 May 2018 23:08:54 +0530
Message-ID: <CAFqt6zbReAQH9Ex1DXcda_qWDY7zPtuu4e8JKXmc9x_ajXC-7g@mail.gmail.com>
References: <20180414191542.GA19820@jordon-HP-15-Notebook-PC>
 <3b3aaa67-7166-34ba-39d8-5a1e1d138309@suse.com>
 <CAFqt6zY0RJDHKqRD3vfnt1sUyObaKjqH7+XYiqSV3ey=d6OPEA@mail.gmail.com>
 <525c0108-a3aa-ea8d-540d-8accd9ac82db@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=flvl=h5=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1fGpWr-0000le-Se
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 17:38:57 +0000
Received: by mail-lf0-x241.google.com with SMTP id p85-v6so4119557lfg.7
 for <xen-devel@lists.xenproject.org>; Thu, 10 May 2018 10:38:56 -0700 (PDT)
In-Reply-To: <525c0108-a3aa-ea8d-540d-8accd9ac82db@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Matthew Wilcox <willy@infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTAsIDIwMTggYXQgMTE6MDIgUE0sIEJvcmlzIE9zdHJvdnNreQo8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3RlOgo+IE9uIDA1LzEwLzIwMTggMDk6NTMgQU0sIFNv
dXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4+IE9uIE1vbiwgQXByIDE2LCAyMDE4IGF0IDE6MzIgUE0s
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+PiBPbiAxNC8wNC8xOCAy
MToxNSwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPj4+PiBVc2UgbmV3IHJldHVybiB0eXBlIHZt
X2ZhdWx0X3QgZm9yIGZhdWx0IGhhbmRsZXIKPj4+PiBpbiBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19z
dHJ1Y3QuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxp
bnV4QGdtYWlsLmNvbT4KPj4+PiBSZXZpZXdlZC1ieTogTWF0dGhldyBXaWxjb3ggPG1hd2lsY294
QG1pY3Jvc29mdC5jb20+Cj4+PiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgo+Pj4KPj4+Cj4+PiBKdWVyZ2VuCj4+Pgo+PiBBbnkgZnVydGhlciBjb21tZW50IG9u
IHRoaXMgcGF0Y2ggPwo+Cj4KPiBJdCBpcyBzY2hlZHVsZWQgdG8gZ28gaW50byA0LjE4Lgo+Cj4K
PiAtYm9yaXMKClRoYW5rcyBCb3JpcyA6KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
