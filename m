From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 12:11:16 +0200
Message-ID: <e690b1e9-29e4-452b-a4fb-f796fba5f1b0@gmail.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <a946a3c9-af1d-2a95-ba52-1cb01ecdcb1e@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6182776645614665298=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jrRo=RA=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gyDEH-0004R5-Iy
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 10:11:21 +0000
Received: by mail-lf1-x144.google.com with SMTP id g2so6386922lfh.11
 for <xen-devel@lists.xenproject.org>; Mon, 25 Feb 2019 02:11:20 -0800 (PST)
In-Reply-To: <a946a3c9-af1d-2a95-ba52-1cb01ecdcb1e@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
List-Id: xen-devel@lists.xenproject.org

--===============6182776645614665298==
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 2/23/19 12:08 AM, Julien Grall wrote:<br>
    <blockquote type="cite"
      cite="mid:a946a3c9-af1d-2a95-ba52-1cb01ecdcb1e@arm.com">
      <pre class="moz-quote-pre" wrap="">

On 22/02/2019 21:00, Stefano Stabellini wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Fri, 22 Feb 2019, Julien Grall wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">BTW, I checked the series with -Wswitch-default:
-Wswitch-default
Warn whenever a switch statement does not have a default case.
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Furthermore, using BUG() is a pretty bad idea in switch.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">It is and not only in the switch. The reason I put BUG is that I tried
to follow
the existing "error handling" at those places.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
It is not because BUG() is been used today in some places that we need to
continue to spread it.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Use of BUG() itself is another topic which will also need to be
addressed
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
So we should not add more of them...
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Again, I see this as a dedicated change. So, in the current series I think
it is
acceptable to use the existing way of error handling if any at all.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
That's not how it works in upstream. If you know some constructs are wrong, it
is best to try to address partially the problem directly then having so you
reduce the amounts of change afterwards.

So please try to not introduce more BUG() in the code base.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi Oleksandr, Julien,

Julien's right that we should not introduce any more BUG()s. In fact,
each of them makes the code less safe, not more safe! The purpose of
MISRAC 16.4 is "defensive programming": write the code in a way that is
more (not less!) resilient to failure.

So, I think it is a good idea to introduce a default label because it
can help us spot unexpected issues. Instead of calling BUG() in the
default handler, which is detrimental, we should return an error when
possible, or just print a warning.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I looked at the first patch and to be honest I can't see how this hence 
our code...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
As 16.4 clearly state, even a simple comment would be enough to address
the rule. We just need to explain why a default label is not needed.
Such as:

   default:
   /* unreachable because blah and blah */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... as we already have defensive code. Indeed, in most of the switch we 
deal with potential issue by initializing the variable before the 
switch. If you look at the first patch, a lot of "default: break;" is 
introduced. So what's our benefits? How this code is more defensive than 
what we currently have?
</pre>
    </blockquote>
    ...and if you remove those initialized variables and forget<br>
    to update the switch with default? Or change the initial value<br>
    the way your previous switch assumptions do not work anymore?<br>
    I am not trying to defend MISRA here, but things change and we all<br>
    make mistakes. This is why defensive programming<br>
    <blockquote type="cite"
      cite="mid:a946a3c9-af1d-2a95-ba52-1cb01ecdcb1e@arm.com">
      <pre class="moz-quote-pre" wrap="">
Furthermore, how this is going to help us (thanks to -Wswitch) if an 
enumerate is extended and we miss a case that the compiler don't notice 
anymore?</pre>
    </blockquote>
    And if the switch's index is not an enumeration, but a plain
    integer...?
    <blockquote type="cite"
      cite="mid:a946a3c9-af1d-2a95-ba52-1cb01ecdcb1e@arm.com">
      <pre class="moz-quote-pre" wrap="">
Cheers,

</pre>
    </blockquote>
    <br>
  </body>
</html>


--===============6182776645614665298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6182776645614665298==--
