From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/9] libxl: Move dm user determination logic
 into a helper function
Date: Wed, 28 Nov 2018 15:20:27 +0000
Message-ID: <20181128152027.67m5qavqnyvg7w3o@zion.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-2-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fE64=OH=citrix.com=prvs=863b436f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gS1ee-00076A-5v
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 15:21:32 +0000
Content-Disposition: inline
In-Reply-To: <20181123171502.29519-2-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDU6MTQ6NTVQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBUbyByZWxpYWJseSBraWxsIGFuIHVudHJ1c3RlZCBkZXZpY2Vtb2RlbCwgd2UgbmVl
ZCB0byBrbm93IG5vdCBvbmx5Cj4gaXRzIHBpZCwgYnV0IGl0cyB1aWQuICBJbiBwcmVwYXJhdGlv
biBmb3IgdGhpcywgbW92ZSB0aGUgdXNlcmlkCj4gZGV0ZXJtaW5hdGlvbiBsb2dpYyBpbnRvIGEg
aGVscGVyIGZ1bmN0aW9uLgo+IAo+IENyZWF0ZSBhIG5ldyBmaWVsZCwgYGRtX3J1bmFzYCwgaW4g
bGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZSB0byBzdG9yZQo+IHRoZSB2YWx1ZSBkdXJpbmcgZG9t
YWluIGNyZWF0aW9uLgo+IAo+IFRoaXMgY2hhbmdlIGFsc28gcmVtb3ZlcyB1bm5lY2Vzc2FyeSBk
dXBsaWNhdGlvbiBvZiB0aGUgYXJndW1lbnQKPiBjb25zdHJ1Y3Rpb24gY29kZS4KPiAKPiBObyBm
dW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpBcyBmYXIgYXMgSSBjYW4gdGVsbCB0aGUg
Y29kZSBpcyBjb3JyZWN0OgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
