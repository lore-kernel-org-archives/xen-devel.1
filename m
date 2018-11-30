From: Julien Grall <julien.grall@arm.com>
Subject: Backport candidate for Arm
Date: Fri, 30 Nov 2018 17:25:05 +0000
Message-ID: <80edd4d5-e2b7-bcb5-32ac-9d2c9096299f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nnkx=OJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gSmXr-0003o4-56
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 17:25:39 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpCZWxvdyBhIGxpc3Qgb2YgYmFja3BvcnQgY2FuZGlkYXRlIGZvciBBcm0uCgoKRm9yIFhl
biA0LjEwKyB0byBoYW5kbGUgY29ycmVjdGx5IFNNQyBjYWxsIHBhcmFtZXRlcnMgYW5kIHJlc3Vs
dAoKMzVmYzYwODYxMgl4ZW4vYXJtOiBzbWNjYy0xLjE6IE1ha2UgcmV0dXJuIHZhbHVlcyB1bnNp
Z25lZCBsb25nCmZhNzk3NGY3NDMgICAgICB4ZW4vYXJtOiBzbWNjYy0xLjE6IEhhbmRsZSBmdW5j
dGlvbiByZXN1bHQgYXMgcGFyYW1ldGVycwoKRm9yIFhlbiA0LjkrIHRvIGF2b2lkIERvbTAgY3Jh
c2ggd2hlbiB1c2luZyBsZXNzIHZDUFVzIHRoYW4gcENQVXMgb24gR0lDdjMKCjcwM2Q5ZDVlYzEg
IAl4ZW4vYXJtOiB2Z2ljLXYzOiBEZWxheSB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIGRvbWFp
biBpbmZvcm1hdGlvbgo1NGVjNTlmNmIwICAgCXhlbi9hcm06IHZnaWMtdjM6IERvbid0IGNyZWF0
ZSBlbXB0eSByZS1kaXN0cmlidXRvciByZWdpb25zIAoKClRoZSBmb2xsb3dpbmcgcGF0Y2ggaXMg
cmVxdWlyZWQgaW4gWGVuIDQuMTEgdG8gYXZvaWQgYnJlYWtpbmcgdGhlIG5ldyB2R0lDIGFmdGVy
IAphcHBseWluZyB0aGUgMiBwcmV2aW91cyBwYXRjaGVzLgoKNjJhYTllN2YxYgl4ZW4vYXJtOiBE
b24ndCBidWlsZCBHSUN2MyB3aXRoIHRoZSBuZXcgdkdJQwoKRm9yIDQuOSsgdG8gbWFrZSB0aGUg
aW50ZXJydXB0IHBhdGggc2FmZXIgYnkgYWRkaW5nIG1pc3NpbmcgYmFycmllcnMKCjE3N2FmZWM0
NTUJeGVuL2FybTogZ2ljOiBFbnN1cmUgd2UgaGF2ZSBhbiBJU0IgYmV0d2VlbiBhY2sgYW5kIGRv
X0lSUSgpCjU1NWU1ZjFiZDIgICAgICB4ZW4vYXJtOiBnaWM6IEVuc3VyZSBvcmRlcmluZyBiZXR3
ZWVuIHJlYWQgb2YgSU5UQUNLIGFuZCBzaGFyZWQgZGF0YQoKRm9yIDQuOSsgdG8gY29tcGx5IHdp
dGggdGhlIGJpbmRpbmcgZGVzY3JpcHRpb24KCjM2ODljNTQ2MzAJeGVuL2FybTogY2hlY2sgZm9y
IG11bHRpYm9vdCBub2RlcyBvbmx5IHVuZGVyIC9jaG9zZW4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
