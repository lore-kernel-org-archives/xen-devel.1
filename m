From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] CODING_STYLE: discourage use of underscores
 where alternatives exist
Date: Thu, 07 Jun 2018 07:56:38 -0600
Message-ID: <5B19399602000078001C9228@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jlm1=iz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fQvPA-00018I-MR
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 13:56:44 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

VW5kZXJzY29yZXMgY29tbW9ubHkgcmVxdWlyZSB0d28ga2V5cHJlc3NlcyB3aGlsZSBoeXBoZW4g
LyBkYXNoIHJlcXVpcmVzCmp1c3Qgb25lLCBhbmQgdGhlIHZpc3VhbCBzZXBhcmF0aW9uIGVmZmVj
dCBvZiBib3RoIGlzIGJhc2ljYWxseSB0aGUgc2FtZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL0NPRElOR19TVFlMRQkyMDE3LTA4LTA5IDE0
OjA3OjQxLjU2NTA1NzgzNiArMDIwMAorKysgYi9DT0RJTkdfU1RZTEUJMjAxOC0wNi0wNyAxNTo1
Mjo1NS4xMzY2MTEwOTIgKzAyMDAKQEAgLTEwNiw2ICsxMDYsMTUgQEAgc2VwYXJhdGUgbGluZXMg
YW5kIGVhY2ggbGluZSBzaG91bGQgYmVnaQogICogTm90ZSBiZWdpbm5pbmcgYW5kIGVuZCBtYXJr
ZXJzIG9uIHNlcGFyYXRlIGxpbmVzIGFuZCBsZWFkaW5nICcqJy4KICAqLwogCitDaG9pY2Ugb2Yg
bmFtZXMKKy0tLS0tLS0tLS0tLS0tLQorCitXaGlsZSBmb3IgaWRlbnRpZmllcnMgdW5kZXJzY29y
ZXMgYXJlIHVuYXZvaWRhYmxlIHdoZW4gYSB2aXN1YWwKK3NlcGFyYXRvciBiZXdlZW4gbmFtZSBj
b21wb25lbnRzIGlzIHdhbnRlZCwgaW4gb3RoZXIgY2FzZXMsIHdoZXJlIGEKK3dpZGVyIHNldCBv
ZiBub24tYWxwaGFudW1lcmljIGNoYXJhY3RlcnMgY2FuIGJlIGNob3NlbiBmcm9tLCB0aGUgdXNl
CitvZiB1bmRlcnNjb3JlcyBpcyBkaXNjb3VyYWdlZC4gIEZvciBleGFtcGxlLCBmb3IgZmlsZSBu
YW1lcyBhbmQKK2NvbW1hbmQgbGluZSBvcHRpb25zIGEgaHlwaGVuIC8gZGFzaCBpcyBjb21tb25s
eSBlYXNpZXIgdG8gdHlwZS4KKwogRW1hY3MgbG9jYWwgdmFyaWFibGVzCiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
