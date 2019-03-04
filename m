From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH for-4.12 RFC] xen/console: Handle NUL
 character in buffer sent via CONSOLEIO_write
Date: Mon, 4 Mar 2019 12:00:15 +0000
Message-ID: <23677.4943.315327.941650@mariner.uk.xensource.com>
References: <20190226230351.12882-1-julien.grall@arm.com>
 <20190227125534.nyez2rcoji5hpxwo@zion.uk.xensource.com>
 <adf74279-633b-e4fd-f5e2-730cf0118544@arm.com>
 <4f388cb0-cf8c-277b-9d75-54886e55840a@tycho.nsa.gov>
 <f558a75d-fc34-d48e-ccf5-001c13faadcd@citrix.com>
 <a1566018-18b9-0157-3623-7599e466cecf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uIg3=RH=citrix.com=prvs=959bd0d79=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1h0mGj-0004qJ-N3
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2019 12:00:29 +0000
In-Reply-To: <a1566018-18b9-0157-3623-7599e466cecf@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbUEFUQ0ggZm9yLTQuMTIgUkZDXSB4ZW4vY29uc29s
ZTogSGFuZGxlIE5VTCBjaGFyYWN0ZXIgaW4gYnVmZmVyIHNlbnQgdmlhIENPTlNPTEVJT193cml0
ZSIpOgo+IE9uIDA0LzAzLzIwMTkgMTE6MjEsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPiB6c2gg
aXMgc2VuZGluZyBhIE5VTCBjaGFyYWN0ZXIgdG8gdGhlIGNvbnNvbGUgaW4gdGhlIG1pZGRsZSBv
ZiB0aGUKPiA+IGJ1ZmZlcj8gIFdoeSB3b3VsZCBpdCBkbyB0aGF0PyAgSXMgdGhhdCBkZWZpbmVk
IGJlaGF2aW9yLCBvciBkb2VzIGl0Cj4gPiBqdXN0IGhhcHBlbiB0byB3b3JrIGJlY2F1c2UgWGVu
IGlzIHRoZSBmaXJzdCBjb25zb2xlIGRldmljZSB0byBhY3QKPiA+IHN0cmFuZ2UgYXMgYSByZXN1
bHQ/Cj4KPiBJIGhhdmUgbm8gaWRlYSB3aHkgbmV3IHZlcnNpb24gb2YgWlNIIGlzIGFkZGluZyAn
XDAnIGluIHRoZQo+IGJ1ZmZlci4gQnV0LCB0byBiZSBob25lc3QsIGl0IGRvZXMgbm90IG1hdHRl
ciB0byBrbm93IGl0Lgo+IAo+IFdoYXQgbWF0dGVycyBpcyBhbiBhcHBsaWNhdGlvbiB1c2luZyB0
aGUgUE9TSVggY2FsbCB3cml0ZSgpIGlzIGZyZWUKPiB0byBwdXQgYSAnXDAnIGluIHRoZSBtaWRk
bGUgb2YgdGhlIHN0cmVhbS4gSXQgaXMgdXAgdG8gdGhlIHJlYWRlcgo+IChpLmUgc2NyZWVuL2dk
Yi4uLikgdG8gZGVjaWRlIGhvdyB0byBpbnRlcnByZXQgdGhlIGNoYXJhY3RlcnMuCgpOdWxzIGFy
ZSBwZXJmZWN0bHkgbGVnaXRpbWF0ZSBpbiB0ZXJtaW5hbCBzdHJlYW1zLiAgVGhleSB1c2VkIHRv
IGJlCnVzZWQgZm9yIHBhZGRpbmcgZm9yIHNsb3cgdGVybWluYWxzLCBmb3IgZXhhbXBsZS4gIFNl
ZSB0ZXJtaW5mbyg1KQpzZWN0aW9uIGBEZWxheXMgYW5kIFBhZGRpbmcnLCBvciBzZWFyY2ggZm9y
IHRoZSBwY3JlIGBcYnBhZCcuCgpOQiB0aGF0IFhlbiBkb2VzIG5vdCBjb250cm9sIHRoZSB1bHRp
bWF0ZSBraW5kIG9mIHRlcm1pbmFsLiAgVGhlCnRlcm1pbmFsIGlzIHdoYXRldmVyIGlzIHVsdGlt
YXRlbHkgY29ubmVjdGVkICh2aWEgYSBzZXJpZXMgb2YgcGh5c2ljYWwKYW5kIGxvZ2ljYWwgbGlu
a3MpIHRvIHRoZSBkb20wJ3MgY29uc29sZSBpbnRlcmZhY2UuCgpUaGVyZSBpcyBubyBidWcgaW4g
enNoIGhlcmUuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
