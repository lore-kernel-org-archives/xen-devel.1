From: Chris Patterson <cjp256@gmail.com>
Subject: Re: [PATCH v6 11/15] xsm,
 argo: XSM control for argo register
Date: Fri, 25 Jan 2019 21:09:59 -0500
Message-ID: <CABZSBQeB-y-HNL6baOSq6Ht03GW4EW8=K=zR=bQaQ7ke0Yozog@mail.gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-12-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4oeg=QC=gmail.com=cjp256@srs-us1.protection.inumbo.net>)
 id 1gnDQD-000444-2K
 for xen-devel@lists.xenproject.org; Sat, 26 Jan 2019 02:10:13 +0000
Received: by mail-io1-xd41.google.com with SMTP id b23so9263182ios.10
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jan 2019 18:10:11 -0800 (PST)
In-Reply-To: <1548295503-15946-12-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtc3RhdGljIGludCBkb21haW5faGFzX3Blcm0oc3RydWN0IGRvbWFpbiAqZG9tMSwgc3RydWN0
IGRvbWFpbiAqZG9tMiwKPiArc3RhdGljIGludCBkb21haW5faGFzX3Blcm0oY29uc3Qgc3RydWN0
IGRvbWFpbiAqZG9tMSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0
IGRvbWFpbiAqZG9tMiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTE2IGNsYXNzLCB1
MzIgcGVybXMpCj4gIHsKClRoaXMgY29uc3QgY29udmVyc2lvbiB0cmlnZ2VycyBjb21waWxhdGlv
biBlcnJvcnM6Cgpob29rcy5jOiBJbiBmdW5jdGlvbiDigJhkb21haW5faGFzX3Blcm3igJk6Cmhv
b2tzLmM6Njk6MTM6IGVycm9yOiBhc3NpZ25tZW50IGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxp
ZmllciBmcm9tCnBvaW50ZXIgdGFyZ2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmll
cnNdCiAgICAgYWQuc2RvbSA9IGRvbTE7CiAgICAgICAgICAgICBeCmhvb2tzLmM6NzA6MTM6IGVy
cm9yOiBhc3NpZ25tZW50IGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxpZmllciBmcm9tCnBvaW50
ZXIgdGFyZ2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCiAgICAgYWQudGRv
bSA9IGRvbTI7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
