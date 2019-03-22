From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] libxc: fix HVM core dump
Date: Fri, 22 Mar 2019 13:06:24 +0100
Message-ID: <9e1ae641-532f-6d2c-e753-b6c789ab8e99@suse.com>
References: <20190320154338.24124-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uXRL=RZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h7IwP-00015k-TQ
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 12:06:29 +0000
In-Reply-To: <20190320154338.24124-1-wei.liu2@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDMvMjAxOSAxNjo0MywgV2VpIExpdSB3cm90ZToKPiBmOTY5YmM5ZmM5NiBmb3JiaWQg
Z2V0X2FkZHJlc3Nfc2l6ZSBjYWxsIG9uIEhWTSBndWVzdHMsIGJlY2F1c2UgdGhhdAo+IGRpZG4n
dCBtYWtlIHNlbnNlLiBJdCBicm9rZSBjb3JlIGR1bXAgZnVuY3Rpb25hbGl0eSBvbiBIVk0gYmVj
YXVzZQo+IGxpYnhjIHVuY29uZGl0aW9uYWxseSBhc2tlZCBmb3IgZ3Vlc3Qgd2lkdGguCj4gCj4g
Rm9yY2UgZ3Vlc3Rfd2lkdGggdG8gYSBzZW5zaWJsZSB2YWx1ZS4KPiAKPiBSZXBvcnRlZC1ieTog
SWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
PiBDYzogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gQ2M6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBKdWVyZ2VuLCB0aGlzIGlzIHByb2Jh
Ymx5IHRvbyBsYXRlIGZvciA0LjEyLCBidXQgeW91IGNhbiBhdCBsZWFzdCBhZGQKPiBhIHJlbGVh
c2Ugbm90ZSBzb21ld2hlcmUuCj4gCj4gSWFuLCBwbGVhc2UgYmFja3BvcnQgdGhpcyB0byA0LjEy
LgoKQXMgd2UgaGF2ZSBhbm90aGVyIGJsb2NrZXIgSSdtIGZpbmUgd2l0aCB0aGlzIHBhdGNoIGZv
ciA0LjEyOgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
