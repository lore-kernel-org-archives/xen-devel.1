From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2] xen-netfront: fix warn message as irq
 device name has '/'
Date: Mon, 13 Aug 2018 08:52:01 -0700 (PDT)
Message-ID: <20180813.085201.1107715561650084682.davem__14122.1917736859$1534175452$gmane$org@davemloft.net>
References: <20180811152137.3627-1-xiliang@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z3cw=k4=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1fpF8W-0005gt-MY
 for xen-devel@lists.xenproject.org; Mon, 13 Aug 2018 15:52:04 +0000
In-Reply-To: <20180811152137.3627-1-xiliang@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xiliang@redhat.com
Cc: jgross@suse.com, netdev@vger.kernel.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogWGlhbyBMaWFuZyA8eGlsaWFuZ0ByZWRoYXQuY29tPg0KRGF0ZTogU2F0LCAxMSBBdWcg
MjAxOCAyMzoyMTozNyArMDgwMA0KDQo+IFRoZXJlIGlzIGEgY2FsbCB0cmFjZSBnZW5lcmF0ZWQg
YWZ0ZXIgY29tbWl0IDJkNDA4YzBkNDU3NGIwMWI5ZWQ0NWUwMjUxNjg4OGJmOTI1ZTExYTkoDQo+
IHhlbi1uZXRmcm9udDogZml4IHF1ZXVlIG5hbWUgc2V0dGluZykuIFRoZXJlIGlzIG5vICdkZXZp
Y2UvdmlmL3h4LXEwLXR4JyBmaWxlIGZvdW5kDQo+IHVuZGVyIC9wcm9jL2lycS94eC8uDQo+IA0K
PiBUaGlzIHBhdGNoIG9ubHkgcGlja3MgdXAgZGV2aWNlIHR5cGUgYW5kIGlkIGFzIGl0cyBuYW1l
Lg0KDQpUaGlzIGFkZHMgYSBjb21waWxlIHdhcm5pbmc6DQoNCmRyaXZlcnMvbmV0L3hlbi1uZXRm
cm9udC5jOiBJbiBmdW5jdGlvbiDigJh4ZW5uZXRfaW5pdF9xdWV1ZeKAmToNCmRyaXZlcnMvbmV0
L3hlbi1uZXRmcm9udC5jOjE2MTQ6Mjogd2FybmluZzogaWdub3JpbmcgcmV0dXJuIHZhbHVlIG9m
IOKAmGtzdHJ0b2ludOKAmSwgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgd2Fybl91bnVzZWRfcmVz
dWx0IFstV3VudXNlZC1yZXN1bHRdDQogIGtzdHJ0b2ludChzdHJyY2hyKHF1ZXVlLT5pbmZvLT54
YmRldi0+bm9kZW5hbWUsICcvJykgKyAxLCAxMCwgJmRldmlkKTsNCiAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
