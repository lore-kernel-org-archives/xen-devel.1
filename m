From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
Date: Fri, 26 Apr 2019 17:22:03 +0100
Message-ID: <b0ab9ed7-135b-6240-a0e8-8200e478b6f8@arm.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
 <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK3c1-00069P-0N
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:22:09 +0000
In-Reply-To: <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgRGFyaW8sCgpPbiAyNi8wNC8yMDE5IDE2OjEzLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiBP
biBUdWUsIDIwMTktMDQtMjMgYXQgMTI6MTMgKzAzMDAsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+
IEhlbGxvIERhcmlvLAo+Pgo+PiBPbiAyMC4wNC4xOSAxODoyNCwgRGFyaW8gRmFnZ2lvbGkgd3Jv
dGU6Cj4+PiBJbiBzY2hlZHVsZSgpLCBpZiB3ZSBwaWNrLCBhcyB0aGUgbmV4dCB2Y3B1IHRvIHJ1
biAobmV4dCkgdGhlIHNhbWUKPj4+IG9uZQo+Pj4gdGhhdCBpcyBydW5uaW5nIGFscmVhZHkgKHBy
ZXYpLCB3ZSBuZXZlciBnZXQgdG8gY2FsbAo+Pj4gY29udGV4dF9zd2l0Y2goKS4KPj4KPj4gQW5k
IHdoYXQgYWJvdXQgYGlmICggcHJldiAhPSBjdXJyZW50IClgIGluCj4+IGFybS9kb21haW4uYzpz
Y2hlZHVsZV90YWlsKCkgPwo+Pgo+IFlvdSdyZSBzdWdnZXN0aW5nIHRoYXQncyByZWR1bmRhbnQg
dG9vLCBhcmVuJ3QgeW91Pwo+IAo+ICBGcm9tIGEgcXVpY2sgbG9vaywgaXQgc2VlbXMgdG8gbWUg
YXMgd2VsbCB0aGF0IGl0IHdvdWxkIGJlLiBJJ20gb2sKPiB0YWtpbmcgY2FyZSBvZiBpdCwgbm90
IHN1cmUgaWYgaW4gdGhpcyBwYXRjaCwgb3IgaW4gYW5vdGhlciBvbmUuCgpJIHRob3VnaHQgQW5k
cmV3IGFscmVhZHkgcXVldWVkIHRoaXMgcGF0Y2g/CgpBbnl3YXksIEkgdGhpbmsgeW91IGFyZSBy
aWdodC4gV2UgY2FuIGRyb3AgdGhlIGNoZWNrIGluIHNjaGVkdWxlX3RhaWwoKSBhcyB3ZWxsLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
