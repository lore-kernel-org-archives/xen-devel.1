From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v6 11/15] xsm,
 argo: XSM control for argo register
Date: Fri, 25 Jan 2019 19:10:30 -0800
Message-ID: <CACMJ4GY=_iXeYR0s2F4CvsaBY3yYLhjzhQzfA124jt3+Nk6K6A@mail.gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-12-git-send-email-christopher.w.clark@gmail.com>
 <CABZSBQeB-y-HNL6baOSq6Ht03GW4EW8=K=zR=bQaQ7ke0Yozog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l9mu=QC=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gnEMm-00020p-C0
 for xen-devel@lists.xenproject.org; Sat, 26 Jan 2019 03:10:44 +0000
Received: by mail-lj1-x229.google.com with SMTP id l15-v6so9994944lja.9
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jan 2019 19:10:43 -0800 (PST)
In-Reply-To: <CABZSBQeB-y-HNL6baOSq6Ht03GW4EW8=K=zR=bQaQ7ke0Yozog@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chris Patterson <cjp256@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgNjoxMCBQTSBDaHJpcyBQYXR0ZXJzb24gPGNqcDI1NkBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gPiAtc3RhdGljIGludCBkb21haW5faGFzX3Blcm0oc3RydWN0
IGRvbWFpbiAqZG9tMSwgc3RydWN0IGRvbWFpbiAqZG9tMiwKPiA+ICtzdGF0aWMgaW50IGRvbWFp
bl9oYXNfcGVybShjb25zdCBzdHJ1Y3QgZG9tYWluICpkb20xLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmRvbTIsCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdTE2IGNsYXNzLCB1MzIgcGVybXMpCj4gPiAgewo+Cj4gVGhpcyBjb25z
dCBjb252ZXJzaW9uIHRyaWdnZXJzIGNvbXBpbGF0aW9uIGVycm9yczoKPgo+IGhvb2tzLmM6IElu
IGZ1bmN0aW9uIOKAmGRvbWFpbl9oYXNfcGVybeKAmToKPiBob29rcy5jOjY5OjEzOiBlcnJvcjog
YXNzaWdubWVudCBkaXNjYXJkcyDigJhjb25zdOKAmSBxdWFsaWZpZXIgZnJvbQo+IHBvaW50ZXIg
dGFyZ2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCj4gICAgICBhZC5zZG9t
ID0gZG9tMTsKPiAgICAgICAgICAgICAgXgo+IGhvb2tzLmM6NzA6MTM6IGVycm9yOiBhc3NpZ25t
ZW50IGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxpZmllciBmcm9tCj4gcG9pbnRlciB0YXJnZXQg
dHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVyc10KPiAgICAgIGFkLnRkb20gPSBkb20y
OwoKYWNrLCByZXBybydkIGFuZCBoYXZlIGZpeC4gdGhhbmtzLgoKQ2hyaXN0b3BoZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
