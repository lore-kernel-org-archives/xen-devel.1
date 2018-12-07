From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/2] x86emul: AVX512 fix+improvement
Date: Fri, 07 Dec 2018 04:11:52 -0700
Message-ID: <5C0A55780200007800204012@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gVE32-00036b-G1
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 11:11:56 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSBhZG1pdCBJIHNob3VsZCBwcm9iYWJseSBoYXZlIGdvdCBhcm91bmQgdG8gcnVuIGFmbCBvbiB0
aGUgd2hvbGUgbG90CmVhcmxpZXIuIEl0IGhhcyBzcG90dGVkIHRoZSBpc3N1ZSBhZGRyZXNzZWQg
aW4gcGF0Y2ggMSBhcyB3ZWxsIGFzIGEKZmV3IG1vcmUgaW4gdGhlIHBlbmRpbmcgdjYgc2VyaWVz
LiBNb3N0IChpbmNsdWRpbmcgdGhlIG9uZSBoZXJlKQp3b3VsZCBoYXZlIGJlZW4gY2F1Z2h0IGJ5
IHRoZSBleGNlcHRpb24gcmVjb3ZlcnkgbG9naWMgb24gdGhlCnN0dWJzLCBidXQgb25lIChpbiB0
aGUgZ2F0aGVyIHBhdGNoIGFkZGl0aW9ucyB0byBHUFIgZGVjb2RpbmcpCndvdWxkIGhhdmUgYmVl
biBhbiBhcnJheSBvdmVycnVuIGluIHJlbGVhc2UgYnVpbGRzIChldmVuIGlmIGp1c3QKb25lIGJ5
IHVwIHRvIDI0IGVudHJpZXMsIGkuZS4gbm90IHVuYm91bmRlZCkuIEFzIG9mIHlldCBJJ20KdW5k
ZWNpZGVkIHdoZXRoZXIgdG8gc2VuZCBvdXQgdjYuMSBmb3IgdGhlIGFmZmVjdGVkIHBhdGNoZXMg
b3IKd2FpdCBmb3IgcmV2aWV3IGZlZWRiYWNrIGJlZm9yZSBzZW5kaW5nIG91dCBhIGZ1bGwgdjcu
CgoxOiBmaXggdmVjdG9yLWxlbmd0aCBjaGVjayBmb3IgQVZYNTEyRiBzY2FsYXIgZnVzZWQtbXVs
dGlwbHktYWRkIGluc25zCjI6IHNsaWdodGx5IGFsdGVyIEFWWDUxMiBleGNlcHRpb24gY2hlY2tp
bmcgY29uZGl0aW9uYWxzCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
