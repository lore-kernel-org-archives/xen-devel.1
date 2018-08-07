From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: don't use privcmd_call() from
 xen_mc_flush()
Date: Tue, 7 Aug 2018 17:17:02 +0200
Message-ID: <ff2b390c-3b4f-67c4-5a1c-35be121fe281__40802.0128649243$1533654950$gmane$org@suse.com>
References: <20180613095806.2978-1-jgross@suse.com>
 <2a9600b0-3b49-7835-a664-9deb30b100a4@suse.com>
 <a4f76a2a-128f-3e2a-44ee-04d57ab5be12@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rp5o=kw=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fn3jN-0003bM-Q9
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 15:17:05 +0000
In-Reply-To: <a4f76a2a-128f-3e2a-44ee-04d57ab5be12@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDgvMTggMTY6MDIsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwOC8wNy8yMDE4
IDA5OjExIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAxMy8wNi8xOCAxMTo1OCwgSnVl
cmdlbiBHcm9zcyB3cm90ZToKPj4+IFVzaW5nIHByaXZjbWRfY2FsbCgpIGZvciBhIHNpbmdsZXRv
biBtdWx0aWNhbGwgc2VlbXMgdG8gYmUgd3JvbmcsIGFzCj4+PiBwcml2Y21kX2NhbGwoKSBpcyB1
c2luZyBzdGFjKCkvY2xhYygpIHRvIGVuYWJsZSBoeXBlcnZpc29yIGFjY2VzcyB0bwo+Pj4gTGlu
dXggdXNlciBzcGFjZS4KPj4+Cj4+PiBBZGQgYSBuZXcgeGVuX3NpbmdsZV9jYWxsKCkgZnVuY3Rp
b24gdG8gYmUgdXNlIGZvciB0aGF0IHB1cnBvc2UuCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gQm9yaXMsIGFueSBvYmplY3Rpb25zPwo+IAo+IAo+IEkg
dGhpbmsgSmFuIHdhbnRlZCBhIGNoYW5nZSBpbiBjb21taXQgbWVzc2FnZS4gSSBjYW4gY29tbWl0
IHdpdGggdGhpczoKPiAKPiAiVXNpbmcgcHJpdmNtZF9jYWxsKCkgZm9yIGEgc2luZ2xldG9uIG11
bHRpY2FsbCBzZWVtcyB0byBiZSB3cm9uZywgYXMKPiAgcHJpdmNtZF9jYWxsKCkgaXMgdXNpbmcg
c3RhYygpL2NsYWMoKSB0byBlbmFibGUgaHlwZXJ2aXNvciBhY2Nlc3MgdG8KPiAgTGludXggdXNl
ciBzcGFjZS4KPiAKPiAgRXZlbiBpZiBjdXJyZW50bHkgbm90IGEgcHJvYmxlbSAocHYgZG9tYWlu
cyBjYW4ndCB1c2UgU01BUCB3aGlsZSBIVk0KPiAgYW5kIFBWSCBkb21haW5zIGNhbid0IHVzZSBt
dWx0aWNhbGxzKSB0aGluZ3MgbWlnaHQgY2hhbmdlIHdoZW4KPiAgUFZIIGRvbTAgc3VwcG9ydCBp
cyBhZGRlZCB0byB0aGUga2VybmVsLiIKClRoaXMgd291bGQgYmUgZmluZSwgdGhhbmtzLgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
