From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v7 01/14] libxl: Enhance libxl__sendmsg_fds
 to deal with EINTR and EWOULDBLOCK
Date: Fri, 21 Dec 2018 14:30:05 +0000
Message-ID: <23580.63725.92336.625926@mariner.uk.xensource.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
 <20181123135355.6001-2-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CRbA=O6=citrix.com=prvs=886b937d6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gaLoc-00018h-HV
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 14:30:14 +0000
In-Reply-To: <20181123135355.6001-2-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY3IDAxLzE0XSBsaWJ4bDogRW5oYW5jZSBs
aWJ4bF9fc2VuZG1zZ19mZHMgdG8gZGVhbCB3aXRoIEVJTlRSIGFuZCBFV09VTERCTE9DSyIpOgo+
IFRoaXMgcGF0Y2ggY2hhbmdlIHRoZSBiZWhhdmlvciBvZiBsaWJ4bF9fc2VuZG1zZ19mZHMgdG8g
cmV0cnkgc2VuZG1zZyBvbgo+IEVJTlRSIGVycm9yLgo+IAo+IFRoaXMgcGF0Y2ggYWxzbyBhbGxv
dyBhIGNhbGxlciBvZiBsaWJ4bF9fc2VuZG1zZ19mZHMgdG8gZGVhbCB3aXRoCj4gRVdPVUxEQkxP
Q0suIFRoZSBmdW5jdGlvbiBub3cgcmVxdWlyZXMgdG8gc2VuZCBvbmx5IDEgYnl0ZSBvZiBkYXRh
IHNvCj4gdGhhdCB3aGVuIGRlYWxpbmcgd2l0aCBub24tYmxvY2tpbmcgZmRzIGEgRVdPVUxEQkxP
Q0sgZXJyb3Igd291bGQgbWVhbgo+IHRoYXQgdGhlIGZkcyBoYXZlbid0IGJlZW4gc2VudCB5ZXQu
IEN1cnJlbnQgY2FsbGVyIGFscmVhZHkgc2VuZCBvbmx5IDEKPiBieXRlLgoKRXZlbiB3aXRoIGEg
YmxvY2tpbmcgZmQsIHNlbmRtc2cgbWF5IGluIHByaW5jaXBsZSByZXBvcnQgYSBzaG9ydAp3cml0
ZS4gIChTbyB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHRhbGsgYWJvdXQgc2hvcnQgd3JpdGVz
IGluCmdlbmVyYWwuKQoKPiBOb3RlczoKPiAgICAgdjc6Cj4gICAgICAgICBhbHdheXMgYXNzZXJ0
IGRhdGFsZW4gPT0gMSwgYnV0IG9ubHkgZmFpbCB3aGVuIHNlbmRtc2cgaGF2ZW4ndCBzZW5kCj4g
ICAgICAgICBldmVyeXRoaW5nIChyICE9IGRhdGFsZW4pCj4gICAgICAgICBjaGVjayBzZW5kbXNn
IHJldHVybiB2YWx1ZSBvbiBzdWNjZXNzIGFzIHdlbGwgKGNoZWNrIGZvciBzaG9ydCB3cml0ZSkK
ClJhdGhlciB0aGFuIGhhdmluZyBhIGZ1bmN0aW9uIHdoaWNoIHRha2VzIGFuIGFyZ3VtZW50IHdo
aWNoCm1hbmRhdG9yaWx5IHRha2VzIHRoZSB2YWx1ZSAxLCBob3cgYWJvdXQgc2ltcGx5IGRlbGV0
aW5nIHRoYXQKYXJndW1lbnQgPwoKWW91IGNhbiBkbyB0aGF0IGluIGEgZm9sbG93dXAgcGF0Y2gg
aWYgeW91IGxpa2UuICBJbiB0aGUgbWVhbnRpbWU6CgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
