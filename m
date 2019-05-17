From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: qcom_scm: Incompatible pointer type build failure
Date: Fri, 17 May 2019 17:10:17 +0100
Message-ID: <23774.56553.445601.436491@mariner.uk.xensource.com>
References: <osstest-135420-mainreport@xen.org>
 <23752.17186.527512.614163@mariner.uk.xensource.com>
 <87d9fbc1-5956-2b7b-0b9a-6368e378d0f6@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xWi3=TR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRfRc-00027K-9X
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 16:10:52 +0000
In-Reply-To: <87d9fbc1-5956-2b7b-0b9a-6368e378d0f6@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "david.brown@linaro.org" <david.brown@linaro.org>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SnVsaWVuIEdyYWxsIHdyaXRlcyAoInFjb21fc2NtOiBJbmNvbXBhdGlibGUgcG9pbnRlciB0eXBl
IGJ1aWxkIGZhaWx1cmUiKToKPiBUaGFuayB5b3UgZm9yIHRoZSByZXBvcnQuCi4uLj4gCj4gT24g
MzAvMDQvMjAxOSAxMzo0NCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBvc3N0ZXN0IHNlcnZpY2Ug
b3duZXIgd3JpdGVzICgiW2xpbnV4LTQuMTkgdGVzdF0gMTM1NDIwOiByZWdyZXNzaW9ucyAtIEZB
SUwiKToKPiA+ICAgIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20uYzogSW4gZnVuY3Rpb24gw6Li
gqzLnHFjb21fc2NtX2Fzc2lnbl9tZW3DouKCrOKEojoKPiA+ICAgIGRyaXZlcnMvZmlybXdhcmUv
cWNvbV9zY20uYzo0Njk6NDc6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDMgb2Ygw6LigqzLnGRt
YV9hbGxvY19jb2hlcmVudMOi4oKs4oSiIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBb
LVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KLi4uCj4gPiBJIHRoaW5rIHRoaXMg
YnVpbGQgZmFpbHVyZSBpcyBwcm9iYWJseSBhIHJlZ3Jlc3Npb247IHJhdGhlciBpdCBpcyBkdWUK
PiA+IHRvIHRoZSBzdHJldGNoIHVwZGF0ZSB3aGljaCBicmluZ3MgaW4gYSBuZXcgY29tcGlsZXIu
Cj4gCj4gVGhlIGJ1ZyBoYXMgYWx3YXlzIGJlZW4gcHJlc2VudCAoYW5kIHN0aWxsIHByZXNlbnQg
aW4gbWFzdGVyKSwgaXQgaXMgcG9zc2libGUgCj4gdGhlIGNvbXBpbGVyIGJlY2FtZSBzbWFydGVy
IHdpdGggdGhlIHVwZ3JhZGUgdG8gc3RyZXRjaC4KPiAKPiBUaGUgcHJvYmxlbSBpcyBzaW1pbGFy
IHRvIFsxXSBhbmQgaGFwcGVuIHdoZW4gdGhlIHNpemUgb2YgcGh5c19hZGRyX3QgaXMgCj4gZGlm
ZmVyZW50IHRvIGRtYV9hZGRyX3QuCj4gCj4gSSBoYXZlIENDZWQgdGhlIG1haW50YWluZXJzIG9m
IHRoaXMgZmlsZS4KClRoYXQgd2FzIHNldmVyYWwgd2Vla3MgYWdvIGFuZCBvc3N0ZXN0IGlzIHN0
aWxsIGJsb2NrZWQgb24gdGhpcy4KQ2FuIHlvdSBwbGVhc2UgYWR2aXNlIHdoYXQgQ09ORklHXyog
dG8gZGlzYWJsZSB0byB3b3JrIGFyb3VuZCB0aGlzID8KCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
