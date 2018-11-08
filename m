From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 01/11] tools/libs/toollog: Provide a
 default logger
Date: Thu, 8 Nov 2018 17:31:49 +0000
Message-ID: <a077dcd4-b115-957d-6d9b-e02d8d3ba6a4@citrix.com>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
 <20181108170805.12774-2-ian.jackson@eu.citrix.com>
 <aba7e30d-63cb-fd76-1544-2cbdcb931233@citrix.com>
 <23524.29245.4775.691541@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nrah=nt=citrix.com=prvs=843bae1bd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gKoEL-0004w3-9r
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 17:36:33 +0000
In-Reply-To: <23524.29245.4775.691541@mariner.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTEvMTggMTc6MjgsIElhbiBKYWNrc29uIHdyb3RlOgo+IEFuZHJldyBDb29wZXIgd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MiAwMS8xMV0gdG9vbHMvbGlicy90b29sbG9n
OiBQcm92aWRlIGEgZGVmYXVsdCBsb2dnZXIiKToKPj4gWW91IHdhbnQgc29tZXRoaW5nIGxpa2U6
Cj4+Cj4+IHN0YXRpYyB4ZW50b29sbG9nX2xvZ2dlcl9zdGRpb3N0cmVhbSBzdGRpb19sb2dnZXIg
PSB7Cj4+IMKgwqDCoCAudnRhYmxlID0gewo+PiDCoMKgwqDCoMKgwqDCoCAudm1lc3NhZ2UgPSBz
dGRpb3N0cmVhbV92bWVzc2FnZSwKPj4gwqDCoMKgwqDCoMKgwqAgLnByb2dyZXNzID0gc3RkaW9z
dHJlYW1fcHJvZ3Jlc3MsCj4+IMKgwqDCoMKgwqDCoMKgIC5kZXN0cm95wqAgPSAwLCAvKiBuby1v
bmUgc2hvdWxkIGRlc3Ryb3kgdGhpcyAqLwo+PiDCoMKgwqAgfSwKPj4gwqDCoMKgIC5taW5fbGV2
ZWwgPSBYVExfUFJPR1JFU1MsCj4+IMKgwqDCoCAvKiBmb3Igb3RoZXIgZmllbGRzIGV4Y2VwdCAu
ZiwgMCBpcyBnb29kICovCj4+IH07Cj4+Cj4+IHN0YXRpYyB2b2lkIF9fYXR0cmlidXRlX18oKF9f
Y29uc3RydWN0b3JfXykpIGluaXRfc3RkaW9fbG9nZ2VyKHZvaWQpCj4+IHsKPj4gwqDCoMKgIHN0
ZGlvX2xvZ2dlci5mID0gc3RkZXJyOwo+PiB9Cj4gQmxpbWV5LiAgSXMgdGhhdCBwb3J0YWJsZSBl
bm91Z2ggPwoKU2hvdWxkIGJlLsKgIEl0cyBob3cgQysrIGdsb2JhbHMgd29yaywgYW5kIGl0IGFw
cGVhcnMgdGhhdCB3ZSBhbHJlYWR5IHVzZQppdCBpbiB4Y19kb20uaCBmb3IgdGhlIGRvbWJ1aWxk
ZXIgcmVnaXN0ZXJfe2xvYWRlcixhcmNoX2hvb2tzfSgpCmluZnJhc3RydWN0dXJlLgoKPiBJIGNh
biBzd2l0Y2ggdG8gdGhhdCBpZiB3ZSB0aGluayBzby4gIEl0J3MgY2VydGFpbmx5IG1vcmUgcGxl
YXNhbnQuCgpBYnNvbHV0ZWx5IChhbHRob3VnaCBiZSB3YXJuZWQgLSB0aGF0IHdhcyBlbnRpcmVs
eSB1bnRlc3RlZCBjb2RlKS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
