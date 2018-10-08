From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V6] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Mon, 8 Oct 2018 10:59:34 +0300
Message-ID: <368c4427-1a67-0e7f-318e-f19359eb6636@bitdefender.com>
References: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhmo=22jwKkUgBUZwMDwJ-NTtrKovj5uZaa94109yQPmnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=auyo=mu=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g9QS3-0001fo-6O
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 07:59:39 +0000
In-Reply-To: <CABfawhmo=22jwKkUgBUZwMDwJ-NTtrKovj5uZaa94109yQPmnA@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, George Dunlap <george.dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvNC8xOCA3OjU2IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MjcsIDIwMTggYXQgMTo1OSBBTSBSYXp2YW4gQ29qb2NhcnUKPiA8cmNvam9jYXJ1QGJpdGRlZmVu
ZGVyLmNvbT4gd3JvdGU6Cj4+Cj4+IEN1cnJlbnRseSB0aGVyZSBpcyBhIHN1Ym9wIGZvciBzZXR0
aW5nIHRoZSBtZW1hY2Nlc3Mgb2YgYSBwYWdlLCBidXQgbm90Cj4+IGZvciBjb25zdWx0aW5nIGl0
LiAgVGhlIG5ldyBIVk1PUF9hbHRwMm1fZ2V0X21lbV9hY2Nlc3MgYWRkcyB0aGlzCj4+IGZ1bmN0
aW9uYWxpdHkuCj4+Cj4+IEJvdGggYWx0cDJtIGdldC9zZXQgbWVtIGFjY2VzcyBmdW5jdGlvbnMg
dXNlIHRoZSBzdHJ1Y3QKPj4geGVuX2h2bV9hbHRwMm1fbWVtX2FjY2VzcyB3aGljaCBoYXMgbm93
IGRyb3BwZWQgdGhlIGBzZXQnIHBhcnQgYW5kIGhhcwo+PiBiZWVuIHJlbmFtZWQgZnJvbSB4ZW5f
aHZtX2FsdHAybV9zZXRfbWVtX2FjY2Vzcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBv
cCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2Fy
dSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiAKPiBMR1RNCj4gQWNrZWQtYnk6IFRhbWFz
IEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KClRoYW5rcyEgSWYgSSdtIG5vdCBtaXN0
YWtlbiwgd2Ugbm93IG9ubHkgbmVlZCBHZW9yZ2UncyBhY2sgdG8gY29tbWl0CnRoaXMgcGF0Y2gg
KHdoaWNoIGNvbmNsdWRlcyBvdXIgI1ZFLXJlbGF0ZWQgc2VyaWVzIC0gdGhlIG9ubHkgdGhpbmcK
c3RpbGwgcmVtYWluaW5nIGFmdGVyIHRoaXMgaXMgdG8gZml4IHRoZSBsb2dkaXJ0eSBWR0EgaXNz
dWUgYXMgZmFyIGFzCndlJ3JlIGNvbmNlcm5lZCkuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
