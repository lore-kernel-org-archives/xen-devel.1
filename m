From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: possible I/O emulation state machine issue
Date: Thu, 12 Apr 2018 08:13:52 -0600
Message-ID: <5ACF85C002000078001BAB6A@prv1-mh.provo.novell.com>
References: <5AB3D5E802000078001B530F@prv-mh.provo.novell.com>
 <9038fd3e-6726-0418-8ce6-e023efb9f012@citrix.com>
 <5AB4BB1E02000078001B5633@gwmail.emea.novell.com>
 <cee96de9e1e94475bc55b3add0f14a44@AMSPEX02CL03.citrite.net>
 <5AB4F4A102000078001B5815@gwmail.emea.novell.com>
 <45c762bb12af4d3289060a452a58e8ec@AMSPEX02CL03.citrite.net>
 <5AB8CE9602000078001B5F5F@prv1-mh.provo.novell.com>
 <af3e3bd283ec4ad89fc8bcfc956d3f1d@AMSPEX02CL03.citrite.net>
 <5ABBD7F202000078001B6E27@prv1-mh.provo.novell.com>
 <1c787264bd5f4be397b3a3b27479d0c2@AMSPEX02CL03.citrite.net>
 <bed2ff64-9459-dcad-33d7-dd5d1bb2c617@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9+ld=hb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f6cz7-0000Ly-Hn
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 14:13:57 +0000
In-Reply-To: <bed2ff64-9459-dcad-33d7-dd5d1bb2c617@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE4IGF0IDE4OjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gSXRzIG9uZSBvZiB0aGUgbWFueSBpdGVtcyBvbiB0aGUgVE9ETyBsaXN0LCBhbG9uZyB3
aXRoIG1haW50YWluaW5nIGEKPiBwcm9wZXIgdmlydHVhbCBUTEIgdG8gYXZvaWQgcmV3YWxrcyBk
dXJpbmcgYSBzaW5nbGUgZW11bGF0aW9uLgoKSGF2aW5nIHRob3VnaHQgYWJvdXQgdGhpcyBzb21l
IG1vcmUgSSBhZ3JlZSB0aGF0IGZvciBjb3JyZWN0bmVzcwphIHZpcnR1YWwgVExCIHdvdWxkIGJl
IHN1ZmZpY2llbnQuIEFsc28gY2FjaGluZyB2YWx1ZXMgcmVhZCBtaWdodApoZWxwIHBlcmZvcm1h
bmNlIGEgbGl0dGxlLCBidXQgYXQgdGhlIGV4cGVuc2Ugb2YgcXVpdGUgYSBiaXQgbW9yZQpsb2dp
Yy9zcGFjZSB0byBtYWludGFpbiB0aGF0IGV4dHJhIGluZm9ybWF0aW9uLiBIZW5jZSBJIGd1ZXNz
IHRoZQpUTEItb25seSBzb2x1dGlvbiBpcyBnb2luZyB0byBiZSBwcmVmZXJhYmxlLgoKSmFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
