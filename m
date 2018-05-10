From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: Change return type to vm_fault_t
Date: Thu, 10 May 2018 13:32:31 -0400
Message-ID: <525c0108-a3aa-ea8d-540d-8accd9ac82db@oracle.com>
References: <20180414191542.GA19820@jordon-HP-15-Notebook-PC>
 <3b3aaa67-7166-34ba-39d8-5a1e1d138309@suse.com>
 <CAFqt6zY0RJDHKqRD3vfnt1sUyObaKjqH7+XYiqSV3ey=d6OPEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kelp=h5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fGpO6-0008JJ-Jp
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 17:29:54 +0000
In-Reply-To: <CAFqt6zY0RJDHKqRD3vfnt1sUyObaKjqH7+XYiqSV3ey=d6OPEA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Souptick Joarder <jrdr.linux@gmail.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Matthew Wilcox <willy@infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTAvMjAxOCAwOTo1MyBBTSwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPiBPbiBNb24s
IEFwciAxNiwgMjAxOCBhdCAxOjMyIFBNLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOgo+PiBPbiAxNC8wNC8xOCAyMToxNSwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPj4+
IFVzZSBuZXcgcmV0dXJuIHR5cGUgdm1fZmF1bHRfdCBmb3IgZmF1bHQgaGFuZGxlcgo+Pj4gaW4g
c3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFNvdXB0
aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IE1hdHRo
ZXcgV2lsY294IDxtYXdpbGNveEBtaWNyb3NvZnQuY29tPgo+PiBSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pgo+Pgo+PiBKdWVyZ2VuCj4+Cj4gQW55IGZ1cnRo
ZXIgY29tbWVudCBvbiB0aGlzIHBhdGNoID8KCgpJdCBpcyBzY2hlZHVsZWQgdG8gZ28gaW50byA0
LjE4LgoKCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
