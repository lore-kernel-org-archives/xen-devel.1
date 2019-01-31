From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/4] x86: further L1TF / XSA-289 guards
Date: Thu, 31 Jan 2019 07:07:37 -0700
Message-ID: <5C5301290200007800212C6B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gpD0G-0005vJ-0e
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 14:07:40 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, nmanthey@amazon.de, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBnb2VzIGFsb25nc2lkZSBOb3JiZXJ0J3Mgc2VyaWVzLCBkZWFsaW5nIHdpdGggYSBmZXcg
bW9yZQpwbGFjZXMgd2hlcmUgSSBoYXBwZW5lZCB0byBrbm93ICh3aXRob3V0IGFueSBhbmFseXNp
cyB0b29scykKZ3Vlc3QgY29udHJvbGxlZCBhcnJheSBhY2Nlc3NlcyBzaXQuIEkndmUgYWRkaXRp
b25hbGx5IGFsc28KY2hlY2tlZCBlbXVsLWk4MjU0LmMsIGFuZCBJIHRoaW5rIG5vIGFkanVzdG1l
bnRzIGFyZSBuZWVkZWQKdGhlcmUgKHRoZXJlIGFyZSBhIGZldyBwb3NzaWJsZSBvdmVycnVucyBi
eSBvbmUsIGJ1dCBqdXN0IGxpa2UKaXMgdGhlIGNhc2UgaW4gcGF0Y2ggMiBJIGRvbid0IHRoaW5r
IHRoZXkgYXJlIGFjdHVhbCBpc3N1ZXMpLgoKMTogeDg2ZW11bDogYXZvaWQgc3BlY3VsYXRpdmUg
b3V0IG9mIGJvdW5kcyBhY2Nlc3NlcwoyOiB4ODYvdk1TSTogYXZvaWQgc3BlY3VsYXRpdmUgb3V0
IG9mIGJvdW5kcyBhY2Nlc3NlcwozOiB4ODYvdlBJQzogYXZvaWQgc3BlY3VsYXRpdmUgb3V0IG9m
IGJvdW5kcyBhY2Nlc3Nlcwo0OiB4ODYvdkxBUElDOiBhdm9pZCBzcGVjdWxhdGl2ZSBvdXQgb2Yg
Ym91bmRzIGFjY2Vzc2VzCgpKw7xyZ2VuLCBJJ3ZlIGNvcGllZCB5b3UgYW55d2F5LCBidXQgSSBh
c3N1bWUgeW91ciBnZW5lcmFsClJhYi11bnRpbC1SQzMgd291bGQgYXBwbHkgdG8gdGhpcyBzZXJp
ZXMgKGFuZCBwZXJoYXBzIHRvCmZ1cnRoZXIgb25lcywgc2hvdWxkIGFueW9uZSBmaW5kIHRpbWUp
IGFzIG11Y2ggYXMgdG8gTm9yYmVydCdzLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
